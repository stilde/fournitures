import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String yellow = '#FDD148';
  String yellowPale = '#FEE048';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new ListView(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                Container(
                  height: 250.0,
                  width: double.infinity,
                  color: Color(getColorHexFromStr(yellow)),
                ),
                Positioned(
                  bottom: 50.0,
                  right: 100.0,
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200.0),
                      color: Color(getColorHexFromStr(yellowPale)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100.0,
                  left: 150.0,
                  child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200.0),
                      color: Color(getColorHexFromStr(yellowPale))
                          .withOpacity(0.5),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    Row(children: <Widget>[
                      SizedBox(width: 15.0),
                      Container(
                          alignment: Alignment.topLeft,
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/chris.jpg')))),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 120.0,
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 30.0,
                        ),
                      ),
                      SizedBox(height: 50.0),
                    ]),
                    SizedBox(height: 50.0),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Hello , Pino',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                     SizedBox(height: 15.0),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('What do you want to buy ?',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        )
      ],
    ));
  }

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }

    return val;
  }
}
