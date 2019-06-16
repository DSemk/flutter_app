import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _pageInfoText = 'Hey there';

  Color _pageBackgroundColor;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                _pageInfoText,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: _pageBackgroundColor,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
