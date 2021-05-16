import 'package:bettapps/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:bettapps/screens/login_view.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        color: Colors.blue,
        child: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
          image: AssetImage("assets/ikan_logo.jpeg"),
          height: 100.0,
          width: 200.0,
        ),
            SizedBox(height: 20,),
            Text('Version 0.0.1', style: whiteFontStyle3)
        ],
      ),
        ),
      ),
    );
  }
}
