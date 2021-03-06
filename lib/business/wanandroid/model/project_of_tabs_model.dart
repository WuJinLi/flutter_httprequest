/// data : [{"children":[],"courseId":13,"id":294,"name":"完整项目","order":145000,"parentChapterId":293,"userControlSetTop":false,"visible":0},{"children":[],"courseId":13,"id":402,"name":"跨平台应用","order":145001,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":367,"name":"资源聚合类","order":145002,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":323,"name":"动画","order":145003,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":314,"name":"RV列表动效","order":145004,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":358,"name":"项目基础功能","order":145005,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":328,"name":"网络&amp;文件下载","order":145011,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":331,"name":"TextView","order":145013,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":336,"name":"键盘","order":145015,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":337,"name":"快应用","order":145016,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":338,"name":"日历&amp;时钟","order":145017,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":339,"name":"K线图","order":145018,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":340,"name":"硬件相关","order":145019,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":357,"name":"表格类","order":145022,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":363,"name":"创意汇","order":145024,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":380,"name":"ImageView","order":145029,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":382,"name":"音视频&amp;相机","order":145030,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":383,"name":"相机","order":145031,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":310,"name":"下拉刷新","order":145032,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":385,"name":"架构","order":145033,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":387,"name":"对话框","order":145035,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":388,"name":"数据库","order":145036,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":391,"name":"AS插件","order":145037,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":400,"name":"ViewPager","order":145039,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":401,"name":"二维码","order":145040,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":312,"name":"富文本编辑器","order":145041,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":526,"name":"IM","order":145042,"parentChapterId":293,"userControlSetTop":false,"visible":1},{"children":[],"courseId":13,"id":539,"name":"未分类","order":145043,"parentChapterId":293,"userControlSetTop":false,"visible":1}]
/// errorCode : 0
/// errorMsg : ""
class ProjectOfTabsModel {
  List<ProjectOfTabsData> data;
  int errorCode;
  String errorMsg;

  ProjectOfTabsModel({
      this.data, 
      this.errorCode, 
      this.errorMsg});

  ProjectOfTabsModel.fromJson(dynamic json) {
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data.add(ProjectOfTabsData.fromJson(v));
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

/// children : []
/// courseId : 13
/// id : 294
/// name : "完整项目"
/// order : 145000
/// parentChapterId : 293
/// userControlSetTop : false
/// visible : 0

class ProjectOfTabsData {
  List<dynamic> children;
  int courseId;
  int id;
  String name;
  int order;
  int parentChapterId;
  bool userControlSetTop;
  int visible;

  ProjectOfTabsData({
      this.children, 
      this.courseId, 
      this.id, 
      this.name, 
      this.order, 
      this.parentChapterId, 
      this.userControlSetTop, 
      this.visible});

  ProjectOfTabsData.fromJson(dynamic json) {
    if (json["children"] != null) {
      children = [];
      json["children"].forEach((v) {
        children.add(v);
      });
    }
    courseId = json["courseId"];
    id = json["id"];
    name = json["name"];
    order = json["order"];
    parentChapterId = json["parentChapterId"];
    userControlSetTop = json["userControlSetTop"];
    visible = json["visible"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (children != null) {
      map["children"] = children.map((v) => v.toJson()).toList();
    }
    map["courseId"] = courseId;
    map["id"] = id;
    map["name"] = name;
    map["order"] = order;
    map["parentChapterId"] = parentChapterId;
    map["userControlSetTop"] = userControlSetTop;
    map["visible"] = visible;
    return map;
  }

}