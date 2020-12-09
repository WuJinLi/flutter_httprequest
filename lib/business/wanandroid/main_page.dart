import 'package:flutter/material.dart';
import 'package:flutter_app/business/wanandroid/commonui/home_page.dart';
import 'package:flutter_app/business/wanandroid/commonui/project_page.dart';
import 'package:flutter_app/business/wanandroid/commonui/structure_page.dart';
import 'package:flutter_app/business/wanandroid/commonui/user_page.dart';
import 'package:flutter_app/business/wanandroid/commonui/wechat_account_page.dart';

import 'res/colors.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _widgets = [
    HomePage(),
    ProjectPage(),
    WechatAccountPage(),
    StructurePage(),
    UserPage()
  ];
  List<String> _tabs = ['首页', '项目', '公众号', '体系', '我的'];

  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WanAndroid'),
      ),
      body: _widgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              '${_tabs[0]}',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text(
              '${_tabs[1]}',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            title: Text(
              '${_tabs[2]}',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_split),
            title: Text(
              '${_tabs[3]}',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_emoticon),
            title: Text(
              '${_tabs[4]}',
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      drawer: showDrawer(),
    );
  }

  Widget showDrawer() {
    return Drawer(
      child: ListView(
        //ListView padding 不为空的时候，Drawer顶部的状态栏就不会有灰色背景
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            //头像
            currentAccountPicture: GestureDetector(
              //圆形头像
              child: ClipOval(
                child: Image.network(
                    'https://avatar.csdnimg.cn/C/0/1/1_yechaoa.jpg'),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            //其他头像
            otherAccountsPictures: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.stars,
                    color: Colors.white,
                  ),
                  onPressed: () {})
            ],
            accountName: Text(
              'WanAndroid',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            accountEmail: Text('12345678@11.com'),
          ),

          ///功能列表
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text("我的收藏"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.color_lens),
            title: Text("切换主题"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pop();
              showThemeDialog();
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("我要分享"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("关于项目"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              //先关闭再跳转
              Navigator.of(context).pop();
            },
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.block),
            title: Text("退出"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              //关闭drawer
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void showThemeDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('切换主题'),
          content: SingleChildScrollView(
            child: Container(
              //包含ListView要指定宽高
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: YColors.themeColor.keys.length,
                itemBuilder: (BuildContext context, int position) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.only(bottom: 15),
                      color: YColors.themeColor[position]["primaryColor"],
                    ),
                    onTap: () async {
                      // Provide.value<ThemeProvide>(context).setTheme(position);
                      // //存储主题下标
                      // SharedPreferences sp =
                      //     await SharedPreferences.getInstance();
                      // sp.setInt("themeIndex", position);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('关闭',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
