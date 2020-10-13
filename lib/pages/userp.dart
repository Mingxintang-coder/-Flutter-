import 'package:flutter/material.dart';
import 'historyp.dart';
import 'recnentDp.dart';

class Userpage extends StatefulWidget {
  Userpage({Key key}) : super(key: key);

  @override
  _UserpageState createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(children: <Widget>[
          Expanded(
            child: Container(
              height: 80,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: ListTile(
                title: Text("用户"),
                subtitle: Text("邮箱"),
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      "http://www.itying.com/images/flutter/3.png"),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "http://www.itying.com/images/flutter/2.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ]),
        Expanded(
            child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(width: 3.0, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(IconData(0xe936, fontFamily: 'Other')),
                title: Text("历史记录"),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Historypage()));
                },
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 2,
              ),     
              ListTile(
                leading: Icon(IconData(0xe883, fontFamily: 'Other')),
                title: Text("最近删除"),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RecentDpage()));
                },
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 2,
              ),
            ],
          ),
        ))
      ],
    );
  }
}
