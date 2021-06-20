import 'package:bettapps/views/coming_soon_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bettapps/helper/shared_preference_helper.dart';
import 'package:bettapps/model/auth.dart';
import 'package:bettapps/views/about_page.dart';
import 'package:bettapps/views/add_item_page.dart';
import 'package:bettapps/views/bayar_page.dart';
import 'package:bettapps/views/dikirim_page.dart';
import 'package:bettapps/views/diproses_page.dart';
import 'package:bettapps/views/diterima_page.dart';
import 'package:bettapps/views/login_page.dart';
import 'package:bettapps/views/toko_page.dart';

import '../widgets/custom_button.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String myOriginName, myUserName, myEmail, myId;

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myId = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  @override
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2CCACA),
        title: Text("Profile"),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                size: 35,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddItemPage();
                }));
              }),
          IconButton(
              icon: Icon(
                Icons.settings,
                size: 35,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return ComingSoonPage();
                }));
              }),
          
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 40, left: 20),
                child: Row(children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Container(
                      //margin: EdgeInsets.only(top: 60, bottom: 30),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/magnus.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 10, top: 2),
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color(0xff2CCACA),
                          ),
                          child: Center(
                            child: Text(
                              "Magnus Carlsen",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffFF1192)),
                          child: Center(
                            child: Text(
                              " AIRO Corps. ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              GestureDetector(
                child: Card(
                  margin: EdgeInsets.only(bottom: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(width: 3, color: Color(0xff2CCACA))),
                  elevation: 7,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      children: <Widget>[
                        Center(
                          child: Container(
                            child: Text("Buka Toko Penjualan"),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(left: 50),
                          icon: Icon(
                            Icons.arrow_forward,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ComingSoonPage();
                  }));
                },
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.09,
              // ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(width: 3, color: Color(0xff2CCACA))),
                elevation: 7,
                child: Container(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BayarPage();
                                }));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/belumdibayar.png"))),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return BayarPage();
                                  }));
                                },
                                child: Text("Bayar"))
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DiprosesPage();
                                }));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image:
                                          AssetImage("assets/diproses.png"))),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DiprosesPage();
                                  }));
                                },
                                child: Text("Diproses"))
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DikirimPage();
                                }));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image: AssetImage("assets/dikirim.jpg"))),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DikirimPage();
                                  }));
                                },
                                child: Text("Dikirim"))
                          ],
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DiterimaPage();
                                }));
                              },
                              child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 10),
                                  height: 30,
                                  width: 30,
                                  child: Image(
                                      image:
                                          AssetImage("assets/diterima.png"))),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DiterimaPage();
                                  }));
                                },
                                child: Text("Diterima"))
                          ],
                        ),
                      ]),
                ),
              ),
              SizedBox(height: 10),
              CustomButton(
                  onPress: () {
                    FirebaseFirestore _firestore = FirebaseFirestore.instance;
                    CollectionReference _users = _firestore.collection('users');
                    _users
                        .doc(myId)
                        .update({
                          'logedIn': "false",
                        })
                        .then((value) => print("User logout"))
                        .catchError((error) => print("Gagal logout"));
                    Auth().toSignOut(context);
                  },
                  text: 'Keluar',
                  color: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}