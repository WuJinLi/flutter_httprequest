/// data : [{"apkLink":"","audit":1,"author":"扔物线","canEdit":false,"chapterId":249,"chapterName":"干货资源","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":false,"id":12554,"link":"https://www.bilibili.com/video/BV1CA41177Se","niceDate":"2020-11-30 00:00","niceShareDate":"2020-03-23 16:36","origin":"","prefix":"","projectLink":"","publishTime":1606665600000,"realSuperChapterId":248,"selfVisible":0,"shareDate":1584952597000,"shareUser":"","superChapterId":249,"superChapterName":"干货资源","tags":[],"title":"Android 面试黑洞&mdash;&mdash;当我按下 Home 键再切回来，会发生什么？","type":1,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>大家在日常开发过程中，应该对invalidate，requestLayout简易的区别都理解，更近准备针对这两个问题问几问。</p>\r\n<p>先来invalidate吧。</p>\r\n<ol>\r\n<li>invalidate 的执行流程是什么样子的？</li>\r\n<li>如果连续调用多次invalidate执行流程是？</li>\r\n<li>invalidate重绘的区域是如何确定的，仅是当前View还是整个View树，还是某种计算方式？</li>\r\n<li>View除了invalidate()外，还有个方法叫做postInvalidateOnAnimation()，这两个方法有何区别？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"id":16190,"link":"https://wanandroid.com/wenda/show/16190","niceDate":"2020-11-24 13:32","niceShareDate":"2020-11-24 13:32","origin":"","prefix":"","projectLink":"","publishTime":1606195950000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1606195930000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | View invalidate() 相关的一些细节探究~","type":1,"userId":2,"visible":1,"zan":4},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>我们在写代码的时候，有时候很容易使用一个高版本的 API，如果不注意，可能会导致在一些低版本的设备崩溃。</p>\r\n<p>因此，我们可以选择引入 lint 在编译时进行检查。</p>\r\n<p>今天的问题是？</p>\r\n<ol>\r\n<li>应用：如何在打包时，强制开启 New API检查？</li>\r\n<li>原理：lint 怎么能知道某个 方法是哪个版本加入的？是有一个汇总的地方维护着这样的方法列表吗？</li>\r\n<li>原理：即使有这样的一个列表，lint是怎么扫描每一个方法调用的？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"id":15949,"link":"https://www.wanandroid.com/wenda/show/15949","niceDate":"2020-11-02 00:15","niceShareDate":"2020-11-02 00:14","origin":"","prefix":"","projectLink":"","publishTime":1604247343000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1604247264000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Call requires API level 23 (current min is 14) 扫描出来的原理是？","type":1,"userId":2,"visible":1,"zan":9}]
/// errorCode : 0
/// errorMsg : ""

class TopArticle {
  List<Data> data;
  int errorCode;
  String errorMsg;

  TopArticle({
      this.data, 
      this.errorCode, 
      this.errorMsg});

  TopArticle.fromJson(dynamic json) {
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data.map((v) => v.toJson()).toList();
    }
    map["errorCode"] = errorCode;
    map["errorMsg"] = errorMsg;
    return map;
  }

}

/// apkLink : ""
/// audit : 1
/// author : "扔物线"
/// canEdit : false
/// chapterId : 249
/// chapterName : "干货资源"
/// collect : false
/// courseId : 13
/// desc : ""
/// descMd : ""
/// envelopePic : ""
/// fresh : false
/// id : 12554
/// link : "https://www.bilibili.com/video/BV1CA41177Se"
/// niceDate : "2020-11-30 00:00"
/// niceShareDate : "2020-03-23 16:36"
/// origin : ""
/// prefix : ""
/// projectLink : ""
/// publishTime : 1606665600000
/// realSuperChapterId : 248
/// selfVisible : 0
/// shareDate : 1584952597000
/// shareUser : ""
/// superChapterId : 249
/// superChapterName : "干货资源"
/// tags : []
/// title : "Android 面试黑洞&mdash;&mdash;当我按下 Home 键再切回来，会发生什么？"
/// type : 1
/// userId : -1
/// visible : 1
/// zan : 0

class Data {
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int realSuperChapterId;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<dynamic> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  Data({
      this.apkLink, 
      this.audit, 
      this.author, 
      this.canEdit, 
      this.chapterId, 
      this.chapterName, 
      this.collect, 
      this.courseId, 
      this.desc, 
      this.descMd, 
      this.envelopePic, 
      this.fresh, 
      this.id, 
      this.link, 
      this.niceDate, 
      this.niceShareDate, 
      this.origin, 
      this.prefix, 
      this.projectLink, 
      this.publishTime, 
      this.realSuperChapterId, 
      this.selfVisible, 
      this.shareDate, 
      this.shareUser, 
      this.superChapterId, 
      this.superChapterName, 
      this.tags, 
      this.title, 
      this.type, 
      this.userId, 
      this.visible, 
      this.zan});

  Data.fromJson(dynamic json) {
    apkLink = json["apkLink"];
    audit = json["audit"];
    author = json["author"];
    canEdit = json["canEdit"];
    chapterId = json["chapterId"];
    chapterName = json["chapterName"];
    collect = json["collect"];
    courseId = json["courseId"];
    desc = json["desc"];
    descMd = json["descMd"];
    envelopePic = json["envelopePic"];
    fresh = json["fresh"];
    id = json["id"];
    link = json["link"];
    niceDate = json["niceDate"];
    niceShareDate = json["niceShareDate"];
    origin = json["origin"];
    prefix = json["prefix"];
    projectLink = json["projectLink"];
    publishTime = json["publishTime"];
    realSuperChapterId = json["realSuperChapterId"];
    selfVisible = json["selfVisible"];
    shareDate = json["shareDate"];
    shareUser = json["shareUser"];
    superChapterId = json["superChapterId"];
    superChapterName = json["superChapterName"];
    if (json["tags"] != null) {
      tags = [];
      json["tags"].forEach((v) {
        tags.add(v);
      });
    }
    title = json["title"];
    type = json["type"];
    userId = json["userId"];
    visible = json["visible"];
    zan = json["zan"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["apkLink"] = apkLink;
    map["audit"] = audit;
    map["author"] = author;
    map["canEdit"] = canEdit;
    map["chapterId"] = chapterId;
    map["chapterName"] = chapterName;
    map["collect"] = collect;
    map["courseId"] = courseId;
    map["desc"] = desc;
    map["descMd"] = descMd;
    map["envelopePic"] = envelopePic;
    map["fresh"] = fresh;
    map["id"] = id;
    map["link"] = link;
    map["niceDate"] = niceDate;
    map["niceShareDate"] = niceShareDate;
    map["origin"] = origin;
    map["prefix"] = prefix;
    map["projectLink"] = projectLink;
    map["publishTime"] = publishTime;
    map["realSuperChapterId"] = realSuperChapterId;
    map["selfVisible"] = selfVisible;
    map["shareDate"] = shareDate;
    map["shareUser"] = shareUser;
    map["superChapterId"] = superChapterId;
    map["superChapterName"] = superChapterName;
    if (tags != null) {
      map["tags"] = tags.map((v) => v.toJson()).toList();
    }
    map["title"] = title;
    map["type"] = type;
    map["userId"] = userId;
    map["visible"] = visible;
    map["zan"] = zan;
    return map;
  }

}