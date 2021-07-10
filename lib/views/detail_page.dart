import 'package:bettapps/views/cart_page.dart';
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
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var db;
  int counter = 0;
  bool fav = false;
  String myUserName, myEmail, myUserCredential, myLogedIn;

  void initState() {
    getMyInfoFromSharedPreferences();
    super.initState();
  }

  getMyInfoFromSharedPreferences() async {
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    myUserCredential = await SharedPreferenceHelper().getUserCredentialId();
    myLogedIn = await SharedPreferenceHelper().getLogedIn();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
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
                    height: MediaQuery.of(context).size.height * 0.5,
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
                  ],
                    )),
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Detail Info",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Rp. " + widget.harga.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        widget.detail,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
          (myLogedIn != "Admin")
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20, top: 50, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (counter != 0)
                                ? GestureDetector(
                                    onTap: () {
                                      Map<String, dynamic> tambahKeranjang = {
                                        "nama": widget.nama,
                                        "detail": widget.detail,
                                        "tipe": widget.tipe,
                                        "dibuat": widget.dibuat,
                                        "gambar": widget.gambar,
                                        "harga": widget.harga * counter,
                                        "jumlah": counter,
                                        "merek": widget.merek,
                                        "terjual": null,
                                        "status": "Menunggu Pembayaran"
                                      };
                                      Map<String, dynamic> tambahPesanan = {
                                        "nama": widget.nama,
                                        "detail": widget.detail,
                                        "tipe": widget.tipe,
                                        "dibuat": widget.dibuat,
                                        "gambar": widget.gambar,
                                        "harga": widget.harga * counter,
                                        "jumlah": counter,
                                        "merek": widget.merek,
                                        "terjual": DateTime.now(),
                                        "status": "Menunggu Pembayaran"
                                      };
                                      Map<String, dynamic> tambahTotalCheckout =
                                          {
                                        "totalCheckout": FieldValue.increment(
                                            widget.harga * counter)
                                      };

                                      DatabaseMethods().tambahKeranjang(
                                          widget.nama,
                                          myUserCredential,
                                          tambahKeranjang);
                                      DatabaseMethods().updateHargaCheckout(
                                          myUserCredential,
                                          tambahTotalCheckout);
                                      DatabaseMethods().checkout(widget.nama,
                                          myUserCredential, tambahPesanan);
                                    },
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: BorderSide(
                                                width: 1, color: Colors.black)),
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(Icons
                                                .add_shopping_cart_rounded))),
                                  )
                                : Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                            width: 1, color: Colors.black)),
                                    child: Container(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.add_shopping_cart_rounded,
                                          color: Colors.grey,
                                        ))),
                            (counter != 0)
                                ? GestureDetector(
                                    onTap: () {
                                      Map<String, dynamic> tambahKeranjang = {
                                        "nama": widget.nama,
                                        "detail": widget.detail,
                                        "tipe": widget.tipe,
                                        "dibuat": widget.dibuat,
                                        "gambar": widget.gambar,
                                        "harga": widget.harga * counter,
                                        "jumlah": counter,
                                        "merek": widget.merek,
                                        "terjual": null,
                                        "status": "Menunggu Pembayaran"
                                      };
                                      Map<String, dynamic> tambahPesanan = {
                                        "nama": widget.nama,
                                        "detail": widget.detail,
                                        "tipe": widget.tipe,
                                        "dibuat": widget.dibuat,
                                        "gambar": widget.gambar,
                                        "harga": widget.harga * counter,
                                        "jumlah": counter,
                                        "merek": widget.merek,
                                        "terjual": DateTime.now(),
                                        "status": "Menunggu Pembayaran"
                                      };
                                      Map<String, dynamic> tambahTotalCheckout =
                                          {
                                        "totalCheckout": FieldValue.increment(
                                            widget.harga * counter)
                                      };

                                      DatabaseMethods().tambahKeranjang(
                                          widget.nama,
                                          myUserCredential,
                                          tambahKeranjang);
                                      DatabaseMethods().updateHargaCheckout(
                                          myUserCredential,
                                          tambahTotalCheckout);
                                      DatabaseMethods().checkout(widget.nama,
                                          myUserCredential, tambahPesanan);

                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return CartPage();
                                      }));
                                    },
                                    child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // side: BorderSide(
                                          //     width: 1, color: Colors.black)
                                        ),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xff2CCACA),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.45,
                                            // padding: EdgeInsets.only(top: 10, bottom: 10),
                                            child: Center(
                                              child: Text("BELI SEKARANG",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                            ))),
                                  )
                                : Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      // side: BorderSide(
                                      //     width: 1, color: Colors.black)
                                    ),
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        // padding: EdgeInsets.only(top: 10, bottom: 10),
                                        child: Center(
                                          child: Text("BELI SEKARANG",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ))),
                            Container(
                              // margin: EdgeInsets.only(
                              //     top: MediaQuery.of(context).size.width * 0.05,
                              //     bottom: MediaQuery.of(context).size.width * 0.2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      color: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
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
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ))),
                                    ),
                                  ),
                                  Text("  " + counter.toString() + "  ",
                                      style: TextStyle(fontSize: 25)),
                                  GestureDetector(
                                    onTap: () {
                                      if (counter <= widget.jumlah) {
                                        setState(() {
                                          counter += 1;
                                        });
                                      } else {
                                        setState(() {
                                          counter += 0;
                                        });
                                      }
                                    },
                                    child: Card(
                                      color: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                          margin: EdgeInsets.all(10),
                                          child: GestureDetector(
                                              onTap: () {
                                                if (counter < widget.jumlah) {
                                                  setState(() {
                                                    counter += 1;
                                                  });
                                                } else {
                                                  setState(() {
                                                    counter += 0;
                                                  });
                                                }
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : SizedBox()
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
