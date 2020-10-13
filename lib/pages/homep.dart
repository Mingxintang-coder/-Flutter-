import 'package:flutter/material.dart';
import '../res/listD.dart';
import '../pages/newsp.dart';
import '../pages/searchp.dart';

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  List<Widget> _getData() {
    var tempList = listN.map((value) {
      return Card(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: <Widget>[
            Container(
              width: 420,
              child: Container(
          height: 260,
          width: 400,
          child: Image.network(value.iurl,fit: BoxFit.fill,),
        ),
            ),
            ListTile(
                title: Text(value.name),
                subtitle: Text(value.brief),
                onTap: () {
                  var n=new NewsInfo();
                    n.name=value.name;
                    n.brief=value.brief;
                    n.iurl=value.iurl;
                    n.cmain=value.cmain;
                    listH.add(n);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Newspages(
                            title: value.name,
                            img: value.iurl,
                            price: value.brief,
                            cmain: value.cmain
                          )));
                }
            ),
          ],
        ),
      );
    });

    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          color: Colors.blue,
          height: 80,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 5, color: Colors.orange),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            margin: EdgeInsets.fromLTRB(70, 10, 70, 10),
            child: ListTile(
              leading: Icon(IconData(0xe64a, fontFamily: 'Img')),
              trailing: Icon(Icons.search),
              onTap: () {Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>Searchpage()));
                      },
              title: TextField(
                decoration: InputDecoration(
                  hintText: "搜索新闻",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 700,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //main listview
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: this._getData(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
