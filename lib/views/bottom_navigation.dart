
import 'package:flutter/material.dart';
import 'package:bettapps/views/cart_page.dart';
import 'package:bettapps/views/home_page.dart';
import 'package:bettapps/views/profil_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedNavbar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = [
      HomePage(),
      CartPage(),
      ProfilPage()
    ];

    return Scaffold(
      body: Center(
        child: _listPage[_selectedNavbar],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: ('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: ('Profile'),
          ),
        ],
        currentIndex: _selectedNavbar,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
