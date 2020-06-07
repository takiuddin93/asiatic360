import 'dart:async';
import 'package:asiatic360/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:asiatic360/signup.dart';
import 'package:asiatic360/login.dart';

Color black = Color(0xFF000000);
Color white = Color(0xFFFFFFFF);
Color green = Color(0xFF6B8449);

SharedPreferences prefs;
var _loginState;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  _loginState = prefs.getString('loginState');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _loginState = prefs.getString('loginState');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
  var _alignment = Alignment.center;
  bool _visible = false;
  Timer _timer;

  _MyHomePageState() {
    _timer = new Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _alignment = Alignment.topCenter;
        _visible = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Stack(children: <Widget>[
      Scaffold(
          backgroundColor: Colors.white,
          body: Container(
              height: media.height,
              width: media.width,
              child: Stack(children: <Widget>[
                Positioned(
                    top: media.height * 0.45,
                    left: media.width * 0.20,
                    right: media.width * 0.20,
                    child: SvgPicture.asset(
                        'assets/svgs/asiatic360_logo_minified.svg')),
              ])))
    ]);
  }

  gotoSignUp() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Signup();
    }));
  }

  gotoLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return new Login();
    }));
  }
}
