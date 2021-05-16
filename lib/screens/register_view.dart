import 'package:flutter/material.dart';
import 'package:bettapps/screens/login_view.dart';
import 'package:bettapps/utils/component/background.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
      child: Container(
        color: Colors.greenAccent,
        padding: EdgeInsets.all(40.0),
        child: Center(
              child: Column(
                children: <Widget>[
                  _titleDescription(),
                  SizedBox(height: size.height * 0.03),
                  _textField(),
                  SizedBox(height: size.height * 0.05),
                  _buildButton(context),
                ],
              ),
        ),
      ),
      ),
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Daftar Ke Aplikasi",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
          ),
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
            filled: true,
            fillColor: Colors.lightBlueAccent,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff8b97ff),
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
            prefixIcon: Icon(Icons.mail_outline_rounded),
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
                color: Color(0xff8b97ff),
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
            prefixIcon: Icon(Icons.lock_outline_rounded),
          ),
          style: TextStyle(color: Colors.white),
          obscureText: true,
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
                color: Color(0xff8b97ff),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 3.0,
              ),
            ),
            hintText: "Confirm Password",
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
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        InkWell(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            height: 50.0,
            width: size.width * 0.5,
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              'DAFTAR',
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(80.0)),
          ),
          onTap: () {
            Get.to(LoginPage());

          },
        ),
        Padding(
          padding: EdgeInsets.all(0),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: GestureDetector(
            onTap: () => Get.to(LoginPage()),
          child: Text(
            "Sudah Punya Akun? Masuk",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2661FA)
            ),
          ),
        ),
        ),
      ],
    );
  }
}
