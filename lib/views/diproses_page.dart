import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'add_item_page.dart';
import 'profil_page.dart';

class DiprosesPage extends StatefulWidget {
  @override
  _DiprosesPageState createState() => _DiprosesPageState();
}

class _DiprosesPageState extends State<DiprosesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proses"),
        elevation: 0.0,
       backgroundColor: Color(0xFF006FEE),
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
                  style: TextStyle(color: Color(0xFF006FEE), fontSize: 16),
                ),
                Text(
                  "Giant",
                  style: TextStyle(
                      color: Color(0xFF006FEE),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 20, top: 50, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/diproses.png"),
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
                      "Status : SEDANG DIKEMAS",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Last Status Update : 06 - Mei - 2021",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "Price : 1.200.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF006FEE),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 33,
                        width: 153,
                        child: Center(
                          child: Text(
                            "Chat Penjual",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 15,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
