import 'package:flutter/material.dart';
import 'package:flutter_app/business/api_request/api_request.dart';
import 'package:flutter_app/business/models/now_weather_of_city.dart';
import 'package:flutter_app/enum/enum.dart';
import 'package:flutter_app/ui/export_index.dart';

class NowWeatherOfCityWidget extends StatefulWidget {
  String id;
  String name;

  @override
  _NowWeatherOfCityWidgetState createState() =>
      _NowWeatherOfCityWidgetState(id: this.id, name: name);

  NowWeatherOfCityWidget({@required this.id, this.name});
}

class _NowWeatherOfCityWidgetState extends State<NowWeatherOfCityWidget> {
  String id;
  String name;
  LoaderState _state = LoaderState.Loading;
  Map<dynamic, dynamic> result;

  _NowWeatherOfCityWidgetState({@required this.id, this.name});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNowWeatherData();
  }

  void getNowWeatherData() async {
    var response = await DataReuest.getNowWeatherOfCity(id)
        .catchError((e) => LoaderState.Failed);
    if (response != null) {
      Now now = (response as NowWeatherOfCity).now;
      result = now.toJson();
      _state = LoaderState.Succeed;
    } else {
      _state = LoaderState.NoData;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.name}'),
      ),
      body: LoaderContainer(
        contentView: ListView.builder(
          itemCount: result?.length,
          itemBuilder: (context, index) {
            String key = result.keys.toList()[index];
            return ListTile(
              title: Text(key),
              subtitle: Text(result[key]),
            );
          },
        ),
        loaderState: _state,
      ),
    );
  }
}
