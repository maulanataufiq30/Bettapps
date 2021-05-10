import 'package:flutter/material.dart';
import 'package:bettapps/launcher/launcher_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bettapps',
      theme: new ThemeData(),
      home: new LauncherPage(),
    );
  }
}
