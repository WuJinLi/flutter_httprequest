
import 'package:flutter_app/business/constant.dart';
import 'package:flutter_app/business/wanandroid/model/article_model.dart';
import 'package:flutter_app/business/wanandroid/model/banner_model.dart';
import 'package:flutter_app/business/wanandroid/model/top_article_model.dart';
import 'package:flutter_app/http_manager/export_index.dart';

class ApiRequest {
  static Future<BannerModel> queryBanner() async {
    return BannerModel.fromJson(
        await HttpManager.get(WAN_ANDROID_BASE_URL + BANNER_URL));
  }

  static Future<TopArticle> queryTopArticle() async {
    return TopArticle.fromJson(
        await HttpManager.get(WAN_ANDROID_BASE_URL + TOP_URL));
  }

  static Future<ArticleModel> queryArticle(int pageNum) async {
    return ArticleModel.fromJson(await HttpManager.get(
        WAN_ANDROID_BASE_URL + 'article/list/$pageNum/json'));
  }
}
