/// code : "200"
/// updateTime : "2020-12-07T14:36+08:00"
/// fxLink : "http://hfx.link/2bo1"
/// now : {"obsTime":"2020-12-07T14:03+08:00","temp":"1","feelsLike":"-4","icon":"100","text":"晴","wind360":"180","windDir":"南风","windScale":"3","windSpeed":"17","humidity":"19","precip":"0.0","pressure":"1033","vis":"30","cloud":"0","dew":"-19"}
/// refer : {"sources":["Weather China"],"license":["no commercial use"]}

class NowWeatherOfCity {
  String code;
  String updateTime;
  String fxLink;
  Now now;
  Refer refer;

  NowWeatherOfCity({
      this.code, 
      this.updateTime, 
      this.fxLink, 
      this.now, 
      this.refer});

  NowWeatherOfCity.fromJson(dynamic json) {
    code = json["code"];
    updateTime = json["updateTime"];
    fxLink = json["fxLink"];
    now = json["now"] != null ? Now.fromJson(json["now"]) : null;
    refer = json["refer"] != null ? Refer.fromJson(json["refer"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = code;
    map["updateTime"] = updateTime;
    map["fxLink"] = fxLink;
    if (now != null) {
      map["now"] = now.toJson();
    }
    if (refer != null) {
      map["refer"] = refer.toJson();
    }
    return map;
  }

}

/// sources : ["Weather China"]
/// license : ["no commercial use"]

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

/// obsTime : "2020-12-07T14:03+08:00"
/// temp : "1"
/// feelsLike : "-4"
/// icon : "100"
/// text : "晴"
/// wind360 : "180"
/// windDir : "南风"
/// windScale : "3"
/// windSpeed : "17"
/// humidity : "19"
/// precip : "0.0"
/// pressure : "1033"
/// vis : "30"
/// cloud : "0"
/// dew : "-19"

class Now {
  String obsTime;
  String temp;
  String feelsLike;
  String icon;
  String text;
  String wind360;
  String windDir;
  String windScale;
  String windSpeed;
  String humidity;
  String precip;
  String pressure;
  String vis;
  String cloud;
  String dew;

  Now({
      this.obsTime, 
      this.temp, 
      this.feelsLike, 
      this.icon, 
      this.text, 
      this.wind360, 
      this.windDir, 
      this.windScale, 
      this.windSpeed, 
      this.humidity, 
      this.precip, 
      this.pressure, 
      this.vis, 
      this.cloud, 
      this.dew});

  Now.fromJson(dynamic json) {
    obsTime = json["obsTime"];
    temp = json["temp"];
    feelsLike = json["feelsLike"];
    icon = json["icon"];
    text = json["text"];
    wind360 = json["wind360"];
    windDir = json["windDir"];
    windScale = json["windScale"];
    windSpeed = json["windSpeed"];
    humidity = json["humidity"];
    precip = json["precip"];
    pressure = json["pressure"];
    vis = json["vis"];
    cloud = json["cloud"];
    dew = json["dew"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["obsTime"] = obsTime;
    map["temp"] = temp;
    map["feelsLike"] = feelsLike;
    map["icon"] = icon;
    map["text"] = text;
    map["wind360"] = wind360;
    map["windDir"] = windDir;
    map["windScale"] = windScale;
    map["windSpeed"] = windSpeed;
    map["humidity"] = humidity;
    map["precip"] = precip;
    map["pressure"] = pressure;
    map["vis"] = vis;
    map["cloud"] = cloud;
    map["dew"] = dew;
    return map;
  }

}