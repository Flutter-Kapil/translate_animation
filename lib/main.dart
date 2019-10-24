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
  int count = 0;
  bool myControllerFwRw = true;
  String translateFrom = 'English';
  String translateTo = 'Indonesia';
  AnimationController myController;
  Animation<Offset> tweenOffSet;

  @override
  void initState() {
    myController =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    myController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    count++;
    print("count right now is $count");
    CurvedAnimation smoothAnimation =
        CurvedAnimation(parent: myController, curve: Curves.bounceOut);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                'Google',
                style: TextStyle(fontFamily: 'ProductSansBold'),
              ),
            ),
            Text(
              'Translate',
              style: TextStyle(fontFamily: 'ProductSansRegular'),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            padding: EdgeInsets.fromLTRB(12, 0.0, 12.0, 0),
            child: Stack(
              children: <Widget>[
                AlignTransition(
                  alignment: Tween(
                          begin: Alignment(-1.0, 0.0), end: Alignment(1.0, 0.0))
                      .animate(myController),
                  child: translatedFromDwnBtn(),
                ),
                Align(
                  alignment: Alignment(0.0, 0.0),
                  child: Transform.rotate(
                    angle: Tween(begin: 0.0, end: 3.1)
                        .transform(myController.value),
                    child: IconButton(
                      onPressed: () {
                        if (myControllerFwRw) {
                          myController.forward();
                          myControllerFwRw = false;
                        } else if (myControllerFwRw == false) {
                          myController.reverse();
                          myControllerFwRw = true;
                        }
                      },
                      icon: Icon(Icons.swap_horiz),
                      color: Colors.blue,
                    ),
                  ),
                ),
                AlignTransition(
                  alignment: Tween(
                          begin: Alignment(1.0, 0.0), end: Alignment(-1.0, 0.0))
                      .animate(myController),
                  child: translatedToDwnBtn(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DropdownButton<String> translatedFromDwnBtn() {
    return DropdownButton(
      underline: Container(color: Colors.white, height: 1.0),
      style: TextStyle(color: Colors.blue),
      iconEnabledColor: Colors.blue,
      value: translateFrom,
      elevation: 5,
      onChanged: (selectedLanguage) {
        translateFrom = selectedLanguage;
        setState(() {});
      },
      items: ['English', 'Indonesia']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  DropdownButton<String> translatedToDwnBtn() {
    return DropdownButton(
      underline: Container(color: Colors.white, height: 1.0),
      style: TextStyle(color: Colors.blue),
      iconEnabledColor: Colors.blue,
      value: translateTo,
      elevation: 5,
      onChanged: (selectedLanguage) {
        translateTo = selectedLanguage;
        setState(() {});
      },
      items: ['English', 'Indonesia']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
