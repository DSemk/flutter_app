import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app/generated/i18n.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _pageBackgroundColor;
  Color _textColor;
  var _randomNumberGenerator;

  void _getRandomColor() async {
    setState(() {
      if (_randomNumberGenerator == null) {
        _randomNumberGenerator = new Random();
      }
      _pageBackgroundColor = new Color.fromARGB(
          255,
          _randomNumberGenerator.nextInt(256),
          _randomNumberGenerator.nextInt(256),
          _randomNumberGenerator.nextInt(256));

      _textColor = new Color(_pageBackgroundColor.value ~/ 1.1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: InkWell(
        onTap: () {
          _getRandomColor();
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                S.of(context).middle_screen_text,
                style: TextStyle(fontSize: 20.0, color: _textColor),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: _pageBackgroundColor,
    );
  }
}
