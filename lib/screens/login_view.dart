import 'package:flutter/material.dart';
import 'package:bettapps/landing/landingpage_view.dart';
import 'package:bettapps/screens/register_view.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        color: Colors.greenAccent,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  _titleDescription(),
                  _textField(),
                  _buildButton(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _titleDescription() {
  return Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 16.0)),
      Text(
        "Login ke Aplikasi",
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
    ],
  );
}

Widget _textField() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      TextFormField(
        decoration: const InputDecoration(
          hoverColor: Colors.white,
          filled: true,
          fillColor: Colors.lightBlueAccent,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          hintText: "Email",
          hintStyle: TextStyle(
            color: Color(0xffccd1ff),
          ),
        ),
        style: TextStyle(color: Colors.white),
        autofocus: false,
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
      TextFormField(
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.lightBlueAccent,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          hintText: "Password",
          hintStyle: TextStyle(
            color: Color(0xffccd1ff),
          ),
        ),
        style: TextStyle(color: Colors.white),
        obscureText: true,
        autofocus: false,
      ),
    ],
  );
}

Widget _buildButton(BuildContext context) {
  return Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.only(top: 16.0)),
      InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          width: double.infinity,
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(30.0)),
        ),
        onTap: () {
          Navigator.of(context)
              .pushReplacement(new MaterialPageRoute(builder: (_) {
            return new LandingPage();
          }));
        },
      ),
      Padding(
        padding: EdgeInsets.only(left: 11.0),
      ),
      Text(
        'Belum punya akun ',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12.0,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 11.0),
      ),
      TextButton(
        child: Text(
          'Daftar',
          style: TextStyle(color: Colors.lightBlueAccent),
        ),
        onPressed: () {
          Navigator.of(context)
              .pushReplacement(new MaterialPageRoute(builder: (_) {
            return new RegisterPage();
          }));
        },
      ),
    ],
  );
}
