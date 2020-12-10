import 'package:flutter/material.dart';
import 'package:flutter_app/business/wanandroid/api/api_request.dart';
import 'package:flutter_app/business/wanandroid/model/project_article_of_tab_model.dart';
import 'package:flutter_app/business/wanandroid/model/project_of_tabs_model.dart';
import 'package:flutter_app/business/wanandroid/ui/item_of_list_about_article.dart';
import 'package:flutter_app/index.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage>
    with TickerProviderStateMixin {
  List<Data> _tabs = List();
  LoaderState _loaderState = LoaderState.Loading;
  TabController _controller;
  int id;
  int currentIndex=0;
  List<Datas> tabOfArticles;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(vsync: this, length: _tabs.length);
    _queryProjectOfTab();
    super.initState();
    _queryProjectArticleOfTab();
  }

  _queryProjectOfTab() async {
    await ApiRequest.queryProjectOfTab()
        .then((value) {
          if (value != null && value.data != null && value.data.length != 0) {
            _tabs = value.data;
            _controller = TabController(vsync: this, length: _tabs.length);
            id=value.data[0].id;
          } else {
            _loaderState = LoaderState.NoData;
          }
        })
        .whenComplete(() => _loaderState = LoaderState.Succeed)
        .catchError((e) => _loaderState = LoaderState.Failed);

    setState(() {});
  }

  _queryProjectArticleOfTab() async{
    await ApiRequest.queryArticle(id).then((value){
      tabOfArticles=value.data.datas.cast<Datas>();
    }).whenComplete(() => _loaderState=LoaderState.Succeed).catchError((()=>_loaderState=LoaderState.Failed));
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: _tabs
              ?.map((e) => Text(
                    e.name,
                  ))
              ?.toList(),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabs.map((e){
          return ArticlesPage(tabOfArticles,_loaderState);
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}

class ArticlesPage extends StatefulWidget {
  List<Datas> datas;
  LoaderState loaderState;

  ArticlesPage(@required this.datas,@required this.loaderState);

  @override
  _ArticlesPageState createState() => _ArticlesPageState(datas,loaderState);
}

class _ArticlesPageState extends State<ArticlesPage> {
  List<Datas> datas;
  LoaderState loaderState;

  _ArticlesPageState(@required this.datas,@required this.loaderState);

  @override
  Widget build(BuildContext context) {
    return LoaderContainer(contentView: ListView.builder(
      itemBuilder: (context,index){
        return ItemOfListAboutArticle(datas[index]?.shareDate.toString(),datas[index]?.author,datas[index]?.title,datas[index]?.chapterName,(){

        });
      },
      itemCount: datas?.length,
    ), loaderState: loaderState);
  }
}

