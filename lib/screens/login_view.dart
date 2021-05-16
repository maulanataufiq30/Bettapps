import 'package:bettapps/utils/app_style.dart';
import 'package:bettapps/utils/component/background.dart';
import 'package:flutter/material.dart';
import 'package:bettapps/landing/landingpage_view.dart';
import 'package:bettapps/screens/register_view.dart';
import 'package:get/get.dart';
import 'package:bettapps/widgets/custom_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  bool errorEmailField = false;
  bool errorPasswordField = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
        color: Colors.greenAccent,
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
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
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
                        labelText: 'Password',
                        hintText: 'Masukkan Password',
                        hintStyle: greyFontStyle,
                        errorText:
                        errorEmailField ? 'Password tidak boleh kosong' : null,
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
                        setState(() {
                          emailController.text.isEmpty
                              ? errorEmailField = true
                              : errorEmailField = false;
                          passwordController.text.isNotEmpty
                              ? errorPasswordField = false
                              : errorPasswordField = true;
                        });
                        if (emailController.text == 'admin' &&
                            passwordController.text == 'admin') {
                          Get.to(LandingPage());}
                         else {
                          showDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (context) =>
                                  FailedDialog(title: 'Gagal', onPress: () { Get.back();}, description: 'Username atau password ssalah!'));
                        }
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: new BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: new LinearGradient(
                                colors: [
                                  Colors.blue,
                                  Colors.blueAccent
                                ]
                            )
                        ),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => Get.to(RegisterPage()),
                      child: Text(
                        "Belum punya akun? Daftar",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
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

Widget _textField(context) {
  Size size = MediaQuery.of(context).size;
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
          prefixIcon: Icon(Icons.mail_outline_rounded),
        ),
        style: TextStyle(color: Colors.white),
        autofocus: false,
      ),
      SizedBox(height: size.height * 0.03),
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
          prefixIcon: Icon(Icons.lock_outline_rounded),
        ),
        style: TextStyle(color: Colors.white),
        obscureText: true,
        autofocus: false,
      ),
    ],
  );
}
