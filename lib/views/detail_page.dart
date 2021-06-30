import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'bottom_navigation.dart';

class DetailPage extends StatefulWidget {
  String get gambar => gambar;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int counter = 0;
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => BottomNavigation(),
            ),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Deskripsi"),
            elevation: 0.0,
            backgroundColor: Colors.lightBlue,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => BottomNavigation(),
                  ),
                );
              },
            ),
          ),
          extendBodyBehindAppBar: false,
          body: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 1,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.97,
                        height: MediaQuery.of(context).size.height * 0.55,
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
                      "Ikan Cupang",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "Giant",
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
                              padding: const EdgeInsets.only(top: 170),
                              child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      fav = !fav;
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
                            ),
                            Image(
                              image: NetworkImage(
                                  "https://i2.wp.com/gdm.id/wp-content/uploads/2021/01/giant.jpg"),
                              // height: MediaQuery.of(context).size.height * 0.4,
                              width: MediaQuery.of(context).size.width * 0.4,
                            )
                          ],
                        )),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Giant",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Ikan Cupang Giant",
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
                                      child: Icon(
                                          Icons.add_shopping_cart_rounded))),
                              Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    // side: BorderSide(
                                    //     width: 1, color: Colors.black)
                                  ),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 10),
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
        ));
  }
}
