import 'package:flutter/material.dart';
import 'package:flutter_app/business/wanandroid/api/api_request.dart';
import 'package:flutter_app/business/wanandroid/model/article_model.dart';
import 'package:flutter_app/business/wanandroid/model/banner_model.dart';
import 'package:flutter_app/business/wanandroid/model/top_article_model.dart';
import 'package:flutter_app/business/wanandroid/ui/item_of_list_about_article.dart';
import 'package:flutter_app/enum/enum.dart';
import 'package:flutter_app/ui/export_index.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerModel _bannerModel;
  TopArticle _topArticle;
  ArticleModel _articleModel;
  LoaderState _loaderState = LoaderState.Loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initPageData();
  }

  void _initPageData() async {
    await Future.wait([
      ApiRequest.queryBanner(),
      ApiRequest.queryTopArticle(),
      ApiRequest.queryArticle(1)
    ])
        .then(
          (value) {
            _bannerModel = value[0];
            _topArticle = value[1];
            _articleModel = value[2];
          },
        )
        .whenComplete(() => _loaderState = LoaderState.Succeed)
        .catchError((e) => _loaderState = LoaderState.Failed);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LoaderContainer(
      contentView: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: MySliverPersistentHeaderDelegate(_bannerModel),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              // var data = _topArticle?.data[index];
              return ItemOfListAboutArticle(
                  _topArticle?.data[index]?.publishTime.toString(),
                  _topArticle?.data[index]?.author,
                  _topArticle?.data[index]?.title,
                  _topArticle?.data[index]?.chapterName);
            }, childCount: _topArticle?.data?.length),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((content, index) {
              // var data = _topArticle?.data[index];
              return ItemOfListAboutArticle(
                  _articleModel?.data?.datas[index].publishTime.toString(),
                  _articleModel?.data?.datas[index].author,
                  _articleModel?.data?.datas[index].title,
                  _articleModel?.data?.datas[index].chapterName);
            }, childCount: _articleModel?.data?.datas?.length),
          )
        ],
      ),
      loaderState: _loaderState,
    );
  }
}

class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  BannerModel _bannerModel;

  MySliverPersistentHeaderDelegate(this._bannerModel);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: Swiper(
        itemCount: _bannerModel?.data?.length,
        itemBuilder: (context, index) {
          return Image.network(
            _bannerModel?.data[index]?.imagePath,
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(),
        control: SwiperControl(),
        autoplay: true,
      ),
    );
  }

  @override
  double get maxExtent => 200.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 如果内容需要更新，设置为true
}
