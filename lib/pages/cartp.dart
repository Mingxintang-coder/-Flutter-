import 'package:flutter/material.dart';
import '../res/listD.dart';

class Cartpage extends StatefulWidget {
  Cartpage({Key key}) : super(key: key);

  @override
  _CartpageState createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {

  List<Widget> _getNews() {
    listC.toSet();
    listC.toList();
    var tempList = listC.map((value) {
      return CheckboxListTile(
        value: value.isSelect,
        onChanged: (bool) {
          setState(() {
            value.isSelect = !value.isSelect;
          });
        },
        secondary: Container(
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          color: Colors.blue,
          height: 80,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Container(
              child: Center(
            child: ListTile(
                trailing: RaisedButton(
                  onPressed: () {
                    setState(() {
                      List<NewsInfo> temp = new List();
                      for (int i = 0; i < listC.length; i++) {
                        if (listC[i].isSelect == false) {
                          temp.add(listC[i]);
                        }
                        else{
                          listD.add(listC[i]);
                        } 
                      }
                      listC = temp;
                    });
                  },
                  color: Colors.orange[900],
                  textColor: Colors.white,
                  child: Text("删除勾选项"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                title: Text(
                  "收藏夹",
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                )),
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
    );
  }
}
