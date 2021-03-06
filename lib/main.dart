import 'dart:async';
import 'package:Asiatic360/dashboard.dart';
import 'package:Asiatic360/utils/universal_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Asiatic360/signup.dart';
import 'package:Asiatic360/login.dart';

SharedPreferences prefs;
var _loginState;
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: UniversalVariables.green));
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
      home: _loginState == "1" ? Dashboard() : Login(),
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
                AnimatedContainer(
                  margin: EdgeInsets.only(
                      left: 10.0,
                      top: media.height * 0.2,
                      right: 10.0,
                      bottom: media.height * 0.2),
                  duration: Duration(milliseconds: 1250),
                  alignment: _alignment,
                  child: Container(
                      height: media.height * 0.15,
                      child: SvgPicture.asset(
                          'assets/svgs/Asiatic360_logo_minified.svg')),
                ),
                Positioned(
                  top: media.height * 0.60,
                  left: media.width * 0.20,
                  right: media.width * 0.20,
                  child: GestureDetector(
                      child: AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 1250),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: media.height * 0.0,
                              left: media.width * 0.0,
                              bottom: 0.0,
                              right: media.width * 0.0),
                          height: media.height * 0.075,
                          width: media.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: UniversalVariables.green),
                            color: UniversalVariables.white,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Get Started",
                                style: TextStyle(
                                  color: UniversalVariables.green,
                                  fontSize: media.width * 0.037,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        gotoSignUp();
                      }),
                ),
                Positioned(
                  top: media.height * 0.70,
                  left: media.width * 0.20,
                  right: media.width * 0.20,
                  child: GestureDetector(
                      child: AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 1250),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: media.height * 0.0,
                              left: media.width * 0.0,
                              bottom: 0.0,
                              right: media.width * 0.0),
                          height: media.height * 0.075,
                          width: media.width,
                          decoration: BoxDecoration(
                            color: UniversalVariables.green,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Login",
                                style: TextStyle(
                                  color: UniversalVariables.white,
                                  fontSize: media.width * 0.037,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        gotoLogin();
                      }),
                ),
                // Positioned(
                //   top: media.height * 0.80,
                //   left: media.width * 0.20,
                //   right: media.width * 0.20,
                //   child: GestureDetector(
                //       child: AnimatedOpacity(
                //         opacity: _visible ? 1.0 : 0.0,
                //         duration: Duration(milliseconds: 1250),
                //         child: Container(
                //           padding: EdgeInsets.only(
                //               top: media.height * 0.0,
                //               left: media.width * 0.0,
                //               bottom: 0.0,
                //               right: media.width * 0.0),
                //           height: media.height * 0.075,
                //           width: media.width,
                //           decoration: BoxDecoration(
                //             color: green,
                //             borderRadius: BorderRadius.circular(4.0),
                //           ),
                //           child: new Row(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: <Widget>[
                //               Text(
                //                 "Login",
                //                 style: TextStyle(
                //                   color: white,
                //                   fontSize: media.width * 0.037,
                //                   fontFamily: 'Poppins',
                //                   fontWeight: FontWeight.w400,
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       onTap: () {
                //         gotoLogin();
                //       }),
                // ),
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
