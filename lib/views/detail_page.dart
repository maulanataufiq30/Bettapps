import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bettapps/helper/shared_preference_helper.dart';
import 'package:bettapps/model/database.dart';
import 'bottom_navigation.dart';

class DetailPage extends StatefulWidget {
  final String nama;
  final String merek;
  final String tipe;
  final int harga;
  final int jumlah;
  final String gambar;
  final String detail;
  final Timestamp dibuat;
  final Timestamp terjual;

  //// Pointer to Update Function
  // final Function onUpdate;
  // //// Pointer to Delete Function
  // final Function onDelete;

  DetailPage(this.nama, this.merek, this.tipe, this.harga, this.jumlah,
      this.gambar, this.detail, this.dibuat, this.terjual);
  @override
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int counter = 0;
  bool fav = false;
  String myUserName;
  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deskripsi"),
        elevation: 0.0,
        backgroundColor: Colors.blue,
      ),
      extendBodyBehindAppBar: false,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(color: Colors.blue),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.tipe,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  widget.nama,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20, top: 50, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 50, right: 20, left: 30),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: Image.network(
                              widget.gambar,
                              width: MediaQuery.of(context).size.width * 0.65,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 260),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Map<String, dynamic> favoritInfoMap = {
                                    "nama": widget.nama,
                                    "detail": widget.detail,
                                    "tipe": widget.tipe,
                                    "dibuat": DateTime.now(),
                                    "gambar": widget.gambar,
                                    "harga": widget.harga,
                                    "jumlah": widget.jumlah,
                                    "merek": widget.merek,
                                    "terjual": null
                                  };
                                  DatabaseMethods().tambahFavorit(
                                      myUserName, favoritInfoMap);
                                  showToast(context);
                                });
                              },
                              child: (fav)
                                  ? Icon(
                                      Icons.favorite_border_outlined,
                                      size: 45,
                                    )
                                  : Icon(
                                      Icons.favorite,
                                      color: Colors.pink,
                                      size: 45,
                                    )),
                        )
                      ],
                    )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Spesifikasi",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        widget.detail,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              if (counter > 1) {
                                setState(() {
                                  counter -= 1;
                                });
                              } else {
                                setState(() {
                                  counter = 0;
                                });
                              }
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      width: 1, color: Colors.black)),
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: GestureDetector(
                                      onTap: () {
                                        if (counter > 0) {
                                          setState(() {
                                            counter -= 1;
                                          });
                                        } else {
                                          setState(() {
                                            counter = 0;
                                          });
                                        }
                                      },
                                      child: Icon(Icons.remove))),
                            ),
                          ),
                          Text("  " + counter.toString() + "  ",
                              style: TextStyle(fontSize: 25)),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                counter += 1;
                              });
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      width: 1, color: Colors.black)),
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          counter += 1;
                                        });
                                      },
                                      child: Icon(Icons.add))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Row(
                        children: [
                          Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      width: 1, color: Colors.black)),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child:
                                      Icon(Icons.add_shopping_cart_rounded))),
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                // side: BorderSide(
                                //     width: 1, color: Colors.black)
                              ),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: Center(
                                    child: Text("BELI SEKARANG",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ))),
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showToast(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: const Text('Berhasil ditambahkan ke favorit!'),
      duration: const Duration(seconds: 1),
      action: SnackBarAction(
        label: 'ACTION',
        onPressed: () {},
      ),
    ));
  }
}
