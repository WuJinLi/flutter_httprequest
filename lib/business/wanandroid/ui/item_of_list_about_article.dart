import 'package:flutter/material.dart';

class ItemOfListAboutArticle extends StatelessWidget {
  String time;
  String author;
  String title;
  String chapterName;
  Function onTap;

  ItemOfListAboutArticle(this.time, this.author, this.title, this.chapterName,this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      '$author',
                      style: TextStyle(
                        fontSize: 19.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$time',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 19.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '$title',
                  style: TextStyle(fontSize: 20.0,),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$chapterName',
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
