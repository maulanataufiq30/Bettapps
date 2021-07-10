import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bettapps/helper/shared_preference_helper.dart';
import 'package:bettapps/model/auth.dart';
import 'package:bettapps/views/add_item_page.dart';
import 'package:bettapps/views/bayar_page.dart';
import 'package:bettapps/views/dikirim_page.dart';
import 'package:bettapps/views/diproses_page.dart';
import 'package:bettapps/views/diterima_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bettapps/model/database.dart';

import '../widgets/custom_button.dart';

// ignore: must_be_immutable
class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  var imageDir;
  String myPict = "DEFAULT", def = "DEFAULT";
  String myUserName, myEmail = "DEFAULT", myCredentialId = "DEFAULT";
  String myId;

@override
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }
  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myCredentialId = await SharedPreferenceHelper().getUserCredentialId();
    myPict = await SharedPreferenceHelper().getUserImageUrl();
    setState(() {});
  }

  Future<File> getImage() async {
    var imageFile;
    final picker = ImagePicker();
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
      return imageDir = imageFile;
    } else {
      return imageDir = imageFile;
    }
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
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: (def != myPict)
                            ? GestureDetector(
                                onTap: () async {
                                  File file = await getImage();
                                  (file != null)
                                      ? myPict =
                                          await DatabaseMethods.uploadGambar(
                                              file)
                                      : myPict = def;
                                  FirebaseFirestore _firestore =
                                      FirebaseFirestore.instance;
                                  CollectionReference _users =
                                      _firestore.collection('users');
                                  _users.doc(myCredentialId).update({
                                    'imageUrl': myPict,
                                  });
                                  SharedPreferenceHelper().saveImageUrl(myPict);
                                  getMyInfoFromSharedPreferences();
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 60, bottom: 30),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(myPict),
                                          fit: BoxFit.cover)),
                                ),
                              )
                            : GestureDetector(
                                onTap: () async {
                                  File file = await getImage();
                                  (file != null)
                                      ? myPict =
                                          await DatabaseMethods.uploadGambar(
                                              file)
                                      : myPict = def;
                                  FirebaseFirestore _firestore =
                                      FirebaseFirestore.instance;
                                  CollectionReference _users =
                                      _firestore.collection('users');
                                  _users.doc(myCredentialId).update({
                                    'imageUrl': myPict,
                                  });
                                  SharedPreferenceHelper().saveImageUrl(myPict);
                                  getMyInfoFromSharedPreferences();
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 60, bottom: 30),
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/add_pp.png"),
                                          fit: BoxFit.cover)),
                                ),
                              )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width * 1,
                child: Row(
                  children: <Widget>[
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
                          myUserName ?? "User",
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
                    Auth().toSignOut(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Sign Out'),
                      ),
                    );
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
