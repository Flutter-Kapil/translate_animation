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
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

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
                  child: Transform.translate(
                    offset: Tween<Offset>(
                            begin: Offset(280.0, 0.0), end: Offset(0.0, 0.0))
                        .transform(myController.value),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
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
                  child: SlideTransition(
                    position: Tween<Offset>(
                            begin: Offset(0.0, 0.0), end: Offset(280.0, 0.0))
                        .animate(myController),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
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
