import 'package:flutter_app/business/constant.dart';
import 'package:flutter_app/business/wanandroid/model/article_model.dart';
import 'package:flutter_app/business/wanandroid/model/banner_model.dart';
import 'package:flutter_app/business/wanandroid/model/project_article_of_tab_model.dart';
import 'package:flutter_app/business/wanandroid/model/project_of_tabs_model.dart';
import 'package:flutter_app/business/wanandroid/model/top_article_model.dart';
import 'package:flutter_app/http_manager/export_index.dart';

class ApiRequest {
  /**
   * 获取首页banner
   */
  static Future<BannerModel> queryBanner() async {
    return BannerModel.fromJson(
        await HttpManager.get(WAN_ANDROID_BASE_URL + BANNER_URL));
  }

  /**
   * 获取置顶文章
   */
  static Future<TopArticle> queryTopArticle() async {
    return TopArticle.fromJson(
        await HttpManager.get(WAN_ANDROID_BASE_URL + TOP_URL));
  }

  /**
   * 获取首页文章
   */
  static Future<ArticleModel> queryArticle(int pageNum) async {
    return ArticleModel.fromJson(await HttpManager.get(
        WAN_ANDROID_BASE_URL + 'article/list/$pageNum/json'));
  }

  /**
   * 获取标签信息
   */
  static Future<ProjectOfTabsModel> queryProjectOfTab() async {
    return ProjectOfTabsModel.fromJson(
        await HttpManager.get(WAN_ANDROID_BASE_URL + TREE_URL));
  }

  /**
   * 获取标签下的文章列表
   */
  static Future<ProjectArticleOfTabModel> queryProjectArticleOfTab(
      int id) async {
    return ProjectArticleOfTabModel.fromJson(await HttpManager.get(
        WAN_ANDROID_BASE_URL + "project/list/1/json?cid=$id"));
  }
}
