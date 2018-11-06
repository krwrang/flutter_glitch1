import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Stack(
          children: <Widget>[
            _getBackground(),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0, top: 50.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      const Spacer(flex: 10),
                      _getField1(),
                      Padding(
                        child: _getField2(),
                        padding: const EdgeInsets.only(top: 8.0),
                      ),
                      const Spacer(flex: 12)
                    ],
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ),
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              behavior: HitTestBehavior.opaque,
            )
          ],
          fit: StackFit.expand,
        ));
  }

  Widget _getField1() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: _getTextfieldDecoration(
          hintText: 'Test 1',
          icon: Icons.access_alarm,
        ));
  }

  Widget _getField2() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: _getTextfieldDecoration(
          hintText: 'Test 2',
          icon: Icons.account_box,
        ));
  }

  InputDecoration _getTextfieldDecoration({String hintText, IconData icon}) {
    return InputDecoration(
      fillColor: Colors.white.withOpacity(0.05),
      filled: true,
      border: _unfocusedBorder(),
      errorBorder: _unfocusedBorder(),
      disabledBorder: _unfocusedBorder(),
      focusedErrorBorder: _focusedBorder(),
      hintText: hintText,
      enabledBorder: _unfocusedBorder(),
      focusedBorder: _focusedBorder(),
      prefixIcon: Icon(
        icon,
        color: Colors.white.withOpacity(0.5),
        size: 20.0,
      ),
    );
  }

  InputBorder _focusedBorder() {
    return UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.green, width: 3.0),
      borderRadius: BorderRadius.zero,
    );
  }

  InputBorder _unfocusedBorder() {
    return UnderlineInputBorder(
        borderSide:
            BorderSide(color: Colors.white.withOpacity(0.2), width: 2.0),
        borderRadius: BorderRadius.zero);
  }

  Widget _getBackground() {
    return Image.network(
      'https://i.imgur.com/saBJGsp.jpg',
      fit: BoxFit.cover,
      repeat: ImageRepeat.noRepeat,
    );
  }
}
