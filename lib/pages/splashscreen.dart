import 'package:development/assets/ColorPellete.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:development/pages/intro_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // loading
    loadData();
    print('loading berhasil');
  }

  Future<Timer> loadData() async {
    //timer loading
    return Timer(Duration(seconds: 8), onDoneLoading);
  }

  onDoneLoading() async {
    // link to IntroPage
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => IntroPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 400.0),
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        "Where jobs find you",
                        style: TextStyle(
                            color: ColorPalette.descriptionColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      //color circularprogressindicator
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
