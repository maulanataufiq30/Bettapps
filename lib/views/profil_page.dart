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
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/custom_button.dart';

// ignore: must_be_immutable
class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String myOriginName, myUserName, myEmail, myId;

  GoogleSignIn _googlSignIn = new GoogleSignIn();

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
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
                    if (imageUrl == null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(
                          //margin: EdgeInsets.only(top: 60, bottom: 30),
                          width: 150,
                          height: 150,
                          child: Icon(
                            Icons.account_circle,
                            size: 150,
                          ),
                        ),
                      )
                    else if (imageUrl != null)
                      Padding(padding: EdgeInsets.only(top: 5)),
                    CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius: 50.0,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width * 1,
                child: Row(
                  children: <Widget>[
                    if (name == null)
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFF2689FA),
                        ),
                        child: Center(
                          child: Text(
                            "Admin",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    if (name != null)
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(bottom: 10),
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Color(0xFF2689FA),
                        ),
                        child: Center(
                          child: Text(
                            name,
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
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffFF1192)),
                      child: Center(
                        child: Text(
                          "Bettapps",
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
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.09,
              // ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(width: 3, color: Colors.blue)),
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
              GestureDetector(
                child: Card(
                  margin: EdgeInsets.only(bottom: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(width: 3, color: Colors.blue)),
                  elevation: 7,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      children: <Widget>[
                        Center(
                          child: Container(
                            child: Text("Tambah Produk"),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(left: 5),
                          icon: Icon(
                            Icons.add,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddItemPage();
                  }));
                },
              ),
              SizedBox(height: 20),
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
                    if (Auth().googlesignIn(context) != null) {
                      Auth().signoutGoogle(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Sign Out'),
                        ),
                      );
                    }
                    if (Auth().googlesignIn(context) == null) {
                      Auth().toSignOut(context);
                    }
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
