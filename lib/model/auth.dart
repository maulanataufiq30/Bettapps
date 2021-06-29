import 'package:bettapps/widgets/custom_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bettapps/helper/shared_preference_helper.dart';
import 'package:bettapps/model/database.dart';
import 'package:bettapps/views/bottom_navigation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

String name;
String email;
String imageUrl;

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  GoogleSignIn _googlSignIn = new GoogleSignIn();

  getCurrentUser() async {
    return auth.currentUser;
  }

  Future signUp(String email, String password, String username,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User userDetail = userCredential.user;

      if (userCredential != null) {
        // SharedPreferenceHelper().saveUserEmail(userDetail.email);
        // SharedPreferenceHelper().saveUserId(userDetail.uid);
        // SharedPreferenceHelper().saveUserName(name);
        // SharedPreferenceHelper().saveOriginName(origin);

        Map<String, dynamic> userInfoMap = {
          "email": userDetail.email,
          "name": username,
          "logedIn": "false",
        };

        DatabaseMethods().tambahAkun(userDetail.uid, userInfoMap).then((value) {
          Navigator.pop(context);
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal membuat akun'),
              content: Text('Email tersebut sudah terdaftar'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);

                    //
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User userDetail = userCredential.user;

      QuerySnapshot querySnapshot =
          await DatabaseMethods().getUserInfo(userDetail.email);

      if (userCredential != null) {
        CollectionReference _users = _firestore.collection('users');
        String myBool = "LOGEDIN";
        SharedPreferenceHelper().saveUserEmail(userDetail.email);
        SharedPreferenceHelper().saveUserId(userDetail.uid);
        SharedPreferenceHelper().saveUserName(querySnapshot.docs[0]['name']);
        SharedPreferenceHelper().saveLogedIn(querySnapshot.docs[0]['logedIn']);

        myBool = await SharedPreferenceHelper().getLogedIn();

        print('XXXXXXXXXX disini');
        print(myBool);
        print('XXXXXXXXXX disini');

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => BottomNavigation()));
        _users
            .doc(userDetail.uid)
            .update({
              'logedIn': "true",
            })
            .then((value) => print("User Login"))
            .catchError((error) => print("Gagal login"));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Gagal masuk'),
              content: Text('Email tidak ditemukan'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      } else if (e.code == 'wrong-password') {
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) => FailedDialog(
                title: 'Gagal',
                onPress: () {
                  Navigator.pop(context);
                },
                description: 'Username atau password ssalah!'));
      }
    }
  }

  Future toSignOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    auth.signOut();
    preferences.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sign Out'),
      ),
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      RestartWidget.restartApp(context);
    });
    //return new LoginPage();
  }

  Future googlesignIn(BuildContext context) async {
    await Firebase.initializeApp();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sign in'),
      ),
    );
    final GoogleSignInAccount googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential authResult =
    await auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      // Checking if email and name is null
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      name = user.displayName;
      email = user.email;
      imageUrl = user.photoURL;

      // Only taking the first part of the name, i.e., First Name
      if (name.contains(" ")) {
        name = name.substring(0, name.indexOf(" "));
      }

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavigation()));

      return '$user';
  }
}
  Future signOutGoogle(context) async {
    await _googlSignIn.signOut();
    auth.signOut();
    print("User Signed Out");
    Future.delayed(const Duration(milliseconds: 500), () {
      RestartWidget.restartApp(context);
    });
  }
}



class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
