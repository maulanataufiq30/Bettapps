import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bettapps/produk/item_card.dart';
import 'package:bettapps/views/cart_page.dart';
import 'package:bettapps/views/message_page.dart';
import 'package:bettapps/views/wishlist_page.dart';
import 'package:get/get.dart';

import '../helper/shared_preference_helper.dart';
import '../model/auth.dart';
import '../utils/app_constant.dart';
import '../utils/app_style.dart';
import '../widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  color: Colors.blue,
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
                            'User',
                            maxLines: 1,
                            style: blackFontBoldStyle0.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Spesial Untukmu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue)),
                    InkWell(
                      child:
                      Text('Lainnya', style: TextStyle(color: Colors.blue)),
                      onTap: () {
                        // showDialog(
                        //     context: context,
                        //     builder: (context) => CommingSoonDialog());
                      },
                    )
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
                              crossAxisCount: 2,
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
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Flash Sale',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue)),
                    InkWell(
                        child:
                        Text('Lainnya', style: TextStyle(color: Colors.blue)),
                        onTap: () {
                        })
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Disekitarmu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue)),
                    InkWell(
                      child:
                      Text('Lainnya', style: TextStyle(color: Colors.blue)),
                      onTap: () {
                        // Get.toNamed(AppRoutes.PANEN);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
