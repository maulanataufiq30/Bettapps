import 'package:bettapps/widgets/custom_bottom_navbar.dart';
import 'package:bettapps/landing/home_page.dart';
import 'package:bettapps/landing/coming_soon_page.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  DateTime backButtonPressedTime;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:
      DoubleBackToCloseApp(
        snackBar: SnackBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 100, horizontal: 40),
          content: Text('Tap sekali lagi untuk keluar.', textAlign: TextAlign.center),),
        child: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            SafeArea(
                child: Container(
                  color: 'FAFAFC'.toColor(),
                )),
            SafeArea(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedPage = index;
                    });
                  },
                  children: [
                    Center(
                      child: HomePage(),
                    ),
                    Center(
                      child: ComingSoonPage(),
                    ),
                    Center(
                      child: ComingSoonPage(),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavBar(
                selectedIndex: selectedPage,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                  pageController.jumpToPage(selectedPage);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
