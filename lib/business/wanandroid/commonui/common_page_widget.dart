
import 'package:flutter/material.dart';


class CommonWidget extends StatelessWidget {
  Widget contentWidget;
  String title;

  CommonWidget({@required this.contentWidget, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${title}'),
      ),
      body: contentWidget,
    );
  }
}
