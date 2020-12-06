/// code : "200"
/// location : [{"name":"天津","id":"101030100","lat":"39.12559","lon":"117.19018","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"11","fxLink":"http://hfx.link/2bo1"},{"name":"南开","id":"101031500","lat":"39.12047","lon":"117.16414","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"25","fxLink":"http://hfx.link/1tjz1"},{"name":"武清","id":"101030200","lat":"39.37692","lon":"117.05796","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"25","fxLink":"http://hfx.link/2bp1"},{"name":"滨海新区","id":"101031100","lat":"39.03284","lon":"117.65417","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"25","fxLink":"http://hfx.link/2by1"},{"name":"宝坻","id":"101030300","lat":"39.71696","lon":"117.30809","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"33","fxLink":"http://hfx.link/2bq1"},{"name":"蓟州","id":"101031400","lat":"40.04534","lon":"117.40744","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"33","fxLink":"http://hfx.link/2c01"},{"name":"津南","id":"101031000","lat":"38.98957","lon":"117.38254","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"35","fxLink":"http://hfx.link/2bx1"},{"name":"东丽","id":"101030400","lat":"39.08776","lon":"117.31396","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"35","fxLink":"http://hfx.link/2br1"},{"name":"红桥","id":"101031700","lat":"39.17506","lon":"117.16329","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"35","fxLink":"http://hfx.link/1tk11"},{"name":"北辰","id":"101030600","lat":"39.22555","lon":"117.13481","adm2":"天津","adm1":"天津市","country":"中国","tz":"Asia/Shanghai","utcOffset":"+08:00","isDst":"0","type":"city","rank":"35","fxLink":"http://hfx.link/2bt1"}]
/// refer : {"sources":["heweather.com"],"license":["commercial license"]}

class LookupInfo {
  String code;
  List<Location> location;
  Refer refer;

  LookupInfo({
      this.code, 
      this.location, 
      this.refer});

  LookupInfo.fromJson(dynamic json) {
    code = json["code"];
    if (json["location"] != null) {
      location = [];
      json["location"].forEach((v) {
        location.add(Location.fromJson(v));
      });
    }
    refer = json["refer"] != null ? Refer.fromJson(json["refer"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    if (location != null) {
      map["location"] = location.map((v) => v.toJson()).toList();
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

/// name : "天津"
/// id : "101030100"
/// lat : "39.12559"
/// lon : "117.19018"
/// adm2 : "天津"
/// adm1 : "天津市"
/// country : "中国"
/// tz : "Asia/Shanghai"
/// utcOffset : "+08:00"
/// isDst : "0"
/// type : "city"
/// rank : "11"
/// fxLink : "http://hfx.link/2bo1"

class Location {
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

  Location({
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

  Location.fromJson(dynamic json) {
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