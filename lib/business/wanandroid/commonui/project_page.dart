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
  List<ProjectOfTabsData> _tabs = List(); //tab数量集合
  LoaderState _loaderState = LoaderState.Loading; //加载状态
  TabController _controller; //tab与tabview的控制器
  int cid = 0;
  int currentIndex = 0; //当前选择的tab的角标
  List<ProjectArticleOfTabDatas> tabOfArticles; //对应标签下文章集合
  List<Widget> articleOfTabWidgets;

  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(vsync: this, length: _tabs.length);
    _queryProjectOfTab();
    super.initState();
    _controller.addListener(() {
      currentIndex = _controller?.index;
      _queryProjectArticleOfTab(_tabs[currentIndex].id);
      articleOfTabWidgets[currentIndex] =
          ArticlesPage(tabOfArticles, _loaderState);
      setState(() {});
    });
  }

  //查询当前页面tab
  _queryProjectOfTab() async {
    await ApiRequest.queryProjectOfTab()
        .then((value) {
          if (value != null && value.data != null && value.data.length != 0) {
            _tabs = value.data;
            _controller = TabController(vsync: this, length: _tabs.length);
            articleOfTabWidgets = List(value.data.length);
            _queryProjectArticleOfTab(value.data[0].id);
          } else {
            _loaderState = LoaderState.NoData;
          }
        })
        .whenComplete(() => _loaderState = LoaderState.Succeed)
        .catchError((e) => _loaderState = LoaderState.Failed);
    setState(() {});
  }

  //查询tab下对应文章
  _queryProjectArticleOfTab(int cid) async {
    await ApiRequest.queryProjectArticleOfTab(cid)
        .then((value) {
          tabOfArticles = value.data.datas;
        })
        .whenComplete(() => _loaderState = LoaderState.Succeed)
        .catchError((() => _loaderState = LoaderState.Failed));
    setState(() {});
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
        children: articleOfTabWidgets,
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
  List<ProjectArticleOfTabDatas> datas;
  LoaderState loaderState;

  ArticlesPage(@required this.datas, @required this.loaderState);

  @override
  _ArticlesPageState createState() => _ArticlesPageState(datas, loaderState);
}

class _ArticlesPageState extends State<ArticlesPage> {
  List<ProjectArticleOfTabDatas> datas;
  LoaderState loaderState;

  _ArticlesPageState(@required this.datas, @required this.loaderState);

  @override
  Widget build(BuildContext context) {
    return LoaderContainer(
        contentView: ListView.builder(
          itemBuilder: (context, index) {
            return ItemOfListAboutArticle(
                datas[index]?.shareDate.toString(),
                datas[index]?.author,
                datas[index]?.title,
                datas[index]?.chapterName,
                () {});
          },
          itemCount: datas?.length,
        ),
        loaderState: loaderState);
  }
}
