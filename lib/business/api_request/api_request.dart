import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/business/constant.dart';
import 'package:flutter_app/business/models/hot_city_model.dart';
import 'package:flutter_app/business/models/lookup_info.dart';
import 'package:flutter_app/http_manager/export_index.dart';

class DataReuest {
  static Future<LookupInfo> getLookup() async {
    final String request_url = HF_API_BASE_URL + 'v2/city/lookup';
    Map<String, dynamic> data = Map();
    data['location'] = 'tianjin';
    data['key'] = HF_API_KEY;

    try {
      final respones = await HttpManager.get(request_url, params: data);
      return LookupInfo.fromJson(respones);
    } on DioError catch (e) {
      return e.error;
    }
  }

  static Future<HotCityModel> getHotCity() async {
    final String request_url = HF_API_BASE_URL + "v2/city/top";
    Map<String, dynamic> data = Map();
    data['key'] = HF_API_KEY;

    try {
      final respones = await HttpManager.get(request_url, params: data);
      return HotCityModel.fromJson(respones);
    } on DioError catch (e) {
      return e.error;
    }
  }
}
