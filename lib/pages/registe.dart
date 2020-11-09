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

  


}
