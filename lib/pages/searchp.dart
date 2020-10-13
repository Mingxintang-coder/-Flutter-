import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  Searchpage({Key key}) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索结果'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 850,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //main listview
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0000.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名0'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0001.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名1'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0002.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名2'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0003.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名3'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0004.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名4'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0005.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名5'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0006.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名6'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0007.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名7'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0008.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名8'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0009.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名9'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 420,
                                child: Container(
                                  height: 260,
                                  width: 400,
                                  child: Image.asset(
                                    'lib/images/0010.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text('新闻名10'),
                                subtitle: Text('简介：xxxxxxx'),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
