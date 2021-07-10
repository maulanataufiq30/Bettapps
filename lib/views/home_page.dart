import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bettapps/produk/item_card.dart';
import 'package:bettapps/views/cart_page.dart';
import 'package:get/get.dart';

import 'package:bettapps/helper/shared_preference_helper.dart';
import 'package:bettapps/model/auth.dart';
import 'package:bettapps/utils/app_constant.dart';
import 'package:bettapps/utils/app_style.dart';
import 'package:bettapps/widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myUserName, myEmail, myId, myCredentialId = "DEFAULT", search;
  TextEditingController searchController = TextEditingController(text: "");

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myCredentialId = await SharedPreferenceHelper().getUserCredentialId();
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
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 80),
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                padding: EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(
                        0.8, 0.0), // 10% of the width, so there are ten blinds.
                    colors: <Color>[Color(0xFF006FEE), Color(0xFF00BEEE)],
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Image(
                            image: AssetImage('assets/bg_dashboard.png'))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Halo', style: whiteFontBoldStyle2),
                        Container(
                          width: 200,
                          child: Text(
                            myUserName ?? 'User',
                            maxLines: 1,
                            style: blackFontBoldStyle1.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text('"Selamat datang di Bettapps"',
                            style: greyFontStyleSmall.copyWith(
                                color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: TextFormField(
                  controller: searchController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 3.0,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: greyFontStyle,
                    prefixIcon: Icon(Icons.search_rounded),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Spesial Untukmu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue)),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.95,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("barang")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  snapshot.data.docs[index];
                              return ItemCard(
                                  documentSnapshot["nama"],
                                  documentSnapshot["merek"],
                                  documentSnapshot["tipe"],
                                  documentSnapshot["harga"],
                                  documentSnapshot["jumlah"],
                                  documentSnapshot["gambar"],
                                  documentSnapshot["detail"],
                                  documentSnapshot["dibuat"],
                                  documentSnapshot["terjual"]);
                            });
                      } else {
                        return Center(
                            child: Text(
                          'Belum ada Barang',
                          style: TextStyle(fontFamily: "Poppins", fontSize: 15),
                        ));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
