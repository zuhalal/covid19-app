import 'dart:async';
import 'package:covid19app/main.dart';
import 'package:covid19app/pages/Login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    var duration = const Duration(seconds: 3);
    Timer(duration, (){
      //Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Flutter Demo Home Page')),
      late BuildContext ctx;
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen())
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/covidapp.png",width: 285, height: 62,),
          ],
        ),
      ),
    );
  }
}

