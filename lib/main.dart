import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: TranslateApp(),
    ));

class TranslateApp extends StatefulWidget {
  @override
  _TranslateAppState createState() => _TranslateAppState();
}

class _TranslateAppState extends State<TranslateApp>
    with SingleTickerProviderStateMixin {
  AnimationController myController;
  Animation<Offset> tweenOffSet;

  @override
  void initState() {
    myController =
        AnimationController(duration: Duration(milliseconds: 600), vsync: this);
    myController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CurvedAnimation smoothAnimation =
        CurvedAnimation(parent: myController, curve: Curves.bounceOut);
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Translate'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment(
                        Tween(begin: -1.0, end: 1.0)
                            .transform(myController.value),
                        0.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Center(
                  child: FlatButton(
                    child: Text('Swap'),
                    onPressed: () {
                      myController.forward();
                      setState(() {});
                    },
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment(
                        Tween(begin: 1.0, end: -1.0)
                            .transform(myController.value),
                        0.0),
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Container translate() {
//  return Container(
//    child: Transform.translate(
//      offset: Tween<Offset>(
//        begin: const Offset(100.0, 50.0),
//        end: const Offset(200.0, 300.0),
//      ).animate(myController),
//      child: Container(
//        height: 100.0,
//        width: 100.0,
//        color: Colors.yellow,
//      ),
//    ),
//  );
//}
