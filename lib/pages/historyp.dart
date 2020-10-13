import 'package:flutter/material.dart';
import '../res/listD.dart';

class Historypage extends StatefulWidget {
  Historypage({Key key}) : super(key: key);

  @override
  _HistorypageState createState() => _HistorypageState();
}

class _HistorypageState extends State<Historypage> {
  
  

  List<Widget> _getNews() {
    listH.toSet();
    listH.toList();
    var tempList = listH.map((value) {
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
              "历史记录",
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
