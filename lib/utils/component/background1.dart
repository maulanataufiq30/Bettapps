import 'package:flutter/material.dart';

import '../app_color.dart';
import '../app_style.dart';

class Background1 extends StatelessWidget {
  final Widget child;

  const Background1({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            height: 240,
            width: double.infinity,
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: primaryColor,
            ),
            // child: Stack(
            //   children: [
            //     Align(
            //         alignment: Alignment.centerRight,
            //         child: Image(
            //             image: AssetImage('assets/bg_dashboard.png'))),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text('Halo', style: whiteFontBoldStyle2),
            //         Container(
            //           width: 200,
            //           child: Text(
            //             'Admin',
            //             maxLines: 1,
            //             style: blackFontBoldStyle0.copyWith(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //         SizedBox(height: 20),
            //         Text('"Selamat datang di Tanipedia"',
            //             style: greyFontStyleSmall.copyWith(
            //                 color: Colors.white)),
            //       ],
            //     ),
            //   ],
            // ),
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Image(
                          image: AssetImage('assets/ic_admin.png')),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Selamat Datang', style: whiteFontBoldStyle2),
                    Container(

                      width: 200,
                      child: Text(
                        'Admin',
                        maxLines: 1,
                        style: blackFontBoldStyle0.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
                "assets/bottom1.png",
                width: size.width
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
                "assets/bottom2.png",
                width: size.width
            ),
          ),
          child
        ],
      ),
    );
  }
}