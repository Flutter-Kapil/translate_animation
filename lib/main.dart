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
  String translateFrom = 'English';
  String translateTo = 'Indonesia';
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
        padding: EdgeInsets.all(12),
        height: 70,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(
                  Tween(begin: -1.0, end: 1.0).transform(myController.value),
                  0.0),
              child: translatedFromDwnBtn(),
            ),
            Align(
              alignment: Alignment(0.0, 0.0),
              child: IconButton(
                onPressed: () {
                  myController.forward();
                },
                icon: Icon(Icons.compare_arrows),
                color: Colors.blue,
              ),
            ),
            Align(
              alignment: Alignment(
                  Tween(begin: 1.0, end: -1.0).transform(myController.value),
                  0.0),
              child: translatedToDwnBtn(),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> translatedFromDwnBtn() {
    return DropdownButton(
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
