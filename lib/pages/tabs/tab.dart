import 'package:flutter/material.dart';
import '../homep.dart';
import '../cartp.dart';
import '../userp.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex=0;
  List _pagelist=[
    Homepage(),
    Cartpage(),
    Userpage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新闻搜索"),
        ),
        body: this._pagelist[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap:(int index){
            setState(() {
              this._currentIndex=index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页")
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe63b,fontFamily:'Cart')),
              title: Text("收藏夹")
            ),
            BottomNavigationBarItem(
              icon: Icon(IconData(0xe64d,fontFamily:'User')),
              title: Text("用户")
            )
          ]
          ),
      );
  }
}