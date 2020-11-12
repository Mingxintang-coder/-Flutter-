import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../res/userD.dart';
import '../tabs/tab.dart';

class Registe extends StatefulWidget {
  Registe({Key key}) : super(key: key);

  @override
  _Registe createState() => _Registe();
}

class _Registe extends State<Registe> {
  TextEditingController tc1 = TextEditingController();
  TextEditingController tc2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('欢迎注册'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: tc1,
                  decoration: InputDecoration(
                    labelText: 'USER',
                  ),
                  autofocus: false, //close keyboard
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: tc2,
                  decoration: InputDecoration(
                    labelText: 'CODE',
                  ),
                  autofocus: false, //close keyboard
                ),
              ),
              RaisedButton(
                onPressed: _registe,
                child: Text('Registe'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _registe() {
    print('waiting');
    if (tc1.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('用户名不能为空'),
              ));
    } else if (tc2.text.toString() == '') {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('密码不能为空'),
              ));
    } else {
      getHttp(tc1.text.toString(), tc2.text.toString()).then((val) {
        setState(() {
          if (val != '-1') {
            List l = val.split(' ');
            user_info = UserInfo(id: l[0], account: l[1]);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Tabs()));
          } else {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('erro'),
                    ));
          }
        });
      });
    }
  }

// 192.168.43.215，192.168.1.10
  // ignore: non_constant_identifier_names
  Future getHttp(String TypeText1, String TypeText2) async {
    try {
      Response response;
      response = await Dio().post("http://192.168.43.215:8080",
          data: {"user": TypeText1, "code": TypeText2, "op": "registe"});
      return response.data;
    } catch (e) {
      return print(e);
    }
  }
}
