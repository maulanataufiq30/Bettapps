import 'package:bettapps/utils/app_style.dart';
import 'package:bettapps/utils/component/background.dart';
import 'package:bettapps/views/register_page.dart';
import 'package:bettapps/model/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bettapps/widgets/custom_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  bool _obsecureText = true;
  void _toggle() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  bool errorEmailField = false;
  bool errorPasswordField = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(40),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _titleDescription(),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Color(0xff8b97ff),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                        labelText: 'Email',
                        hintText: 'Masukkan Email',
                        hintStyle: greyFontStyle,
                        errorText:
                            errorEmailField ? 'Email tidak boleh kosong' : null,
                        prefixIcon: Icon(Icons.mail_outline_rounded),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            // color: Color(0xff8b97ff),
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                        labelText: 'Password',
                        hintText: 'Masukkan Password',
                        hintStyle: greyFontStyle,
                        errorText: errorEmailField
                            ? 'Password tidak boleh kosong'
                            : null,
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: RaisedButton(
                      onPressed: () async {
                        Auth().signIn(emailController.text,
                            passwordController.text, context);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: new LinearGradient(
                                colors: [Colors.blue, Colors.blueAccent])),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Belum memiliki akun? ",
                        style: TextStyle(
                          color: Color(0xFF2661FA),
                          fontSize: 11,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterPage();
                          }));
                        },
                        child: Text(
                          "Daftar disini! ",
                          style: TextStyle(
                              color: Color(0xFF2661FA),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

Widget _titleDescription() {
  return Column(
    children: <Widget>[
      Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
      Text(
        "Login ke Aplikasi",
        style: TextStyle(color: Colors.black, fontSize: 36.0),
      ),
      Padding(
        padding: EdgeInsets.only(top: 12.0),
      ),
    ],
  );
}
