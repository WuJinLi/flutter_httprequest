/// code : "200"
/// topCityList : [{"name":"余杭","id":"101210106","lat":"30.42118","lon":"120.30173","adm2":"杭州","adm1":"浙江省","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"25","fxLink":"http://hfx.link/32t1"},{"name":"嘉定","id":"101020500","lat":"31.38352","lon":"121.25033","adm2":"上海","adm1":"上海市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"23","fxLink":"http://hfx.link/2bf1"},{"name":"朝阳","id":"101010300","lat":"39.92148","lon":"116.48641","adm2":"北京","adm1":"北京市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"15","fxLink":"http://hfx.link/2az1"},{"name":"萧山","id":"101210102","lat":"30.16293","lon":"120.27069","adm2":"杭州","adm1":"浙江省","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"23","fxLink":"http://hfx.link/32p1"},{"name":"上海","id":"101020100","lat":"31.23170","lon":"121.47264","adm2":"上海","adm1":"上海市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"11","fxLink":"http://hfx.link/2bc1"},{"name":"江干","id":"101210111","lat":"30.26660","lon":"120.20263","adm2":"杭州","adm1":"浙江省","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"25","fxLink":"http://hfx.link/1tvn1"},{"name":"海淀","id":"101010200","lat":"39.95607","lon":"116.31031","adm2":"北京","adm1":"北京市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"15","fxLink":"http://hfx.link/2ay1"},{"name":"杭州","id":"101210101","lat":"30.28745","lon":"120.15357","adm2":"杭州","adm1":"浙江省","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"11","fxLink":"http://hfx.link/32o1"},{"name":"深圳","id":"101280601","lat":"22.54700","lon":"114.08594","adm2":"深圳","adm1":"广东省","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"13","fxLink":"http://hfx.link/3i71"},{"name":"金水","id":"101180112","lat":"34.77583","lon":"113.68603","adm2":"郑州","adm1":"河南省","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"25","fxLink":"http://hfx.link/1tst1"}]
/// refer : {"sources":["heweather.com"],"license":["commercial license"]}

class HotCityModel {
  String code;
  List<TopCityList> topCityList;
  Refer refer;

  HotCityModel({
      this.code, 
      this.topCityList, 
      this.refer});

  HotCityModel.fromJson(dynamic json) {
    code = json["code"];
    if (json["topCityList"] != null) {
      topCityList = [];
      json["topCityList"].forEach((v) {
        topCityList.add(TopCityList.fromJson(v));
      });
    }
    refer = json["refer"] != null ? Refer.fromJson(json["refer"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    if (topCityList != null) {
      map["topCityList"] = topCityList.map((v) => v.toJson()).toList();
    }
    if (refer != null) {
      map["refer"] = refer.toJson();
    }
    return map;
  }

}

/// sources : ["heweather.com"]
/// license : ["commercial license"]

class Refer {
  List<String> sources;
  List<String> license;

  Refer({
      this.sources, 
      this.license});

  Refer.fromJson(dynamic json) {
    sources = json["sources"] != null ? json["sources"].cast<String>() : [];
    license = json["license"] != null ? json["license"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sources"] = sources;
    map["license"] = license;
    return map;
  }

}

/// name : "余杭"
/// id : "101210106"
/// lat : "30.42118"
/// lon : "120.30173"
/// adm2 : "杭州"
/// adm1 : "浙江省"
/// country : "中国"
/// tz : "Asia/Shanghai"
/// utcOffset : "+08:00"
/// isDst : "0"
/// type : "city"
/// rank : "25"
/// fxLink : "http://hfx.link/32t1"

class TopCityList {
  String name;
  String id;
  String lat;
  String lon;
  String adm2;
  String adm1;
  String country;
  String tz;
  String utcOffset;
  String isDst;
  String type;
  String rank;
  String fxLink;

  TopCityList({
      this.name, 
      this.id, 
      this.lat, 
      this.lon, 
      this.adm2, 
      this.adm1, 
      this.country, 
      this.tz, 
      this.utcOffset, 
      this.isDst, 
      this.type, 
      this.rank, 
      this.fxLink});

  TopCityList.fromJson(dynamic json) {
    name = json["name"];
    id = json["id"];
    lat = json["lat"];
    lon = json["lon"];
    adm2 = json["adm2"];
    adm1 = json["adm1"];
    country = json["country"];
    tz = json["tz"];
    utcOffset = json["utcOffset"];
    isDst = json["isDst"];
    type = json["type"];
    rank = json["rank"];
    fxLink = json["fxLink"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    map["id"] = id;
    map["lat"] = lat;
    map["lon"] = lon;
    map["adm2"] = adm2;
    map["adm1"] = adm1;
    map["country"] = country;
    map["tz"] = tz;
    map["utcOffset"] = utcOffset;
    map["isDst"] = isDst;
    map["type"] = type;
    map["rank"] = rank;
    map["fxLink"] = fxLink;
    return map;
  }

}