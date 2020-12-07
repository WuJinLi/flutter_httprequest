import 'package:flutter/material.dart';
import 'package:flutter_app/business/api_request/api_request.dart';
import 'package:flutter_app/business/models/hot_city_model.dart';
import 'index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var lookup;

  void getNetWorkRequest() async {
    final response = await DataReuest.getLookup();
    setState(() {
      lookup = response;
    });
  }

  void getHotCityData() async {
    final response = await DataReuest.getHotCity();
    if(response!=null){
      state=LoaderState.Succeed;
      lookup = response;
    }else{
      state=LoaderState.NoData;
    }
    setState(() {
    });
  }

  LoaderState state = LoaderState.Loading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getNetWorkRequest();
    getHotCityData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: LoaderContainer(
          contentView: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${lookup?.topCityList[index]?.name}'),
                subtitle: Text('${lookup?.topCityList[index]?.country}'),
                onTap: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${lookup?.topCityList[index]?.name}'),
                    ),
                  );
                },
              );
            },
            itemCount: lookup as HotCityModel == null
                ? 0
                : lookup?.topCityList?.length,
          ),
          loaderState:
              state), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
