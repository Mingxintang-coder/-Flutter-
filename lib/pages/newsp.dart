import 'package:flutter/material.dart';
import 'package:flutter_obj_a/res/listD.dart';

class Newspages extends StatefulWidget {
  Newspages({Key key, this.title, this.img, this.price, this.cmain})
      : super(key: key);

  String img;
  String price;
  String title;
  String cmain;

  @override
  _NewspagesState createState() => _NewspagesState(
      title: this.title, img: this.img, price: this.price, cmain: this.cmain);
}

class _NewspagesState extends State<Newspages> {
  _NewspagesState({this.title, this.img, this.price, this.cmain});

  String img;
  String price;
  String title;
  String cmain;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("新闻资料查找"),
        ),
        body: Column(
          children: <Widget>[
            Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  height: 450,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(this.title),
                          subtitle: Text(this.price),
                        ),
                        AspectRatio(
                          aspectRatio: 5 / 3,
                          child: Image.network(this.img),
                        ),
                        Text(this.cmain)
                      ],
                    ),
                  ),
                )),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "相关新闻",
              style: TextStyle(fontSize: 20),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                height: 200,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 50),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Image.network(this.img),
                        title: Text(this.title),
                        subtitle: Text(this.price),
                      ),
                      ListTile(
                        leading: Image.network(this.img),
                        title: Text(this.title),
                        subtitle: Text(this.price),
                      ),
                      ListTile(
                        leading: Image.network(this.img),
                        title: Text(this.title),
                        subtitle: Text(this.price),
                      ),
                      ListTile(
                        leading: Image.network(this.img),
                        title: Text(this.title),
                        subtitle: Text(this.price),
                      ),
                      ListTile(
                        leading: Image.network(this.img),
                        title: Text(this.title),
                        subtitle: Text(this.price),
                      ),
                      ListTile(
                        leading: Image.network(this.img),
                        title: Text(this.title),
                        subtitle: Text(this.price),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    var n=new NewsInfo();
                    n.name=this.title;
                    n.brief=this.price;
                    n.iurl=this.img;
                    n.cmain=this.cmain;
                    listC.add(n);
                  },
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.horizontal(left: Radius.circular(10.0))
                  // ),
                  color: Colors.orange[400],
                  textColor: Colors.white,
                  child: Text("加入收藏夹"),
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            )
          ],
        ));
  }
}
