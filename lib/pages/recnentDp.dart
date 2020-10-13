import 'package:flutter/material.dart';
import '../res/listD.dart';

class RecentDpage extends StatefulWidget {
  RecentDpage({Key key}) : super(key: key);

  @override
  _RecentDpageState createState() => _RecentDpageState();
}

class _RecentDpageState extends State<RecentDpage> {
 

  List<Widget> _getNews() {
    listD.toSet();
    listD.toList();
    var tempList = listD.map((value) {
      return ListTile(
        leading: Container(
          height: 60,
          width: 100,
          child: Image.network(value.iurl,fit: BoxFit.fill,),
        ),
        title: Text(value.name),
        subtitle: Text(value.brief),
      );
    });

    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("新闻资料查找"),
        ),
      body: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: 80,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Container(
              child: Center(
            child: Text(
              "最近删除",
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          )),
        ),
        Container(
          height: 700,
          child: SingleChildScrollView(
            child: //main listview
                Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: this._getNews(),
            ),
          ),
        )
      ],
    ),
    );
  }
}