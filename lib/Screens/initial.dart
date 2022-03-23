import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/home/home1.dart';
import 'package:flutter_auth/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail, finalPass;

class initial extends StatefulWidget {
  static String id = 'initial';
  @override
  State<initial> createState() => _initialState();
}

class _initialState extends State<initial> {
  @override
  void initState() {
    getVlidationData().whenComplete(() async {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext ctx) =>
                      finalEmail == null || finalEmail.isEmpty
                          ? WelcomeScreen()
                          : Home())));
    });
    super.initState();
  }

  Future getVlidationData() async {
    final prefs = await SharedPreferences.getInstance();

    String obtainedEmail = prefs.getString(KEmail) ?? '';
    String obtainedPass = prefs.getString(KPassword) ?? '';

    setState(() {
      // print('jjjjjjjj');
      print(obtainedEmail);
      // print(obtainedPass);
      finalEmail = obtainedEmail;
      finalPass = obtainedPass;
    });
    // print(finalEmail);
    // print(finalPass);

    try {
      //await loginUser(auth);

      QuerySnapshot value = await FirebaseFirestore.instance
          .collection('users')
          .where(KEmail, isEqualTo: obtainedEmail)
          .where(KPassword, isEqualTo: obtainedPass)
          .snapshots()
          .first;
      // print(value.docs[0].data());
      user = UserM.fromJson(value.docs[0].data() as Map<String, dynamic>);
      // print(user!.username);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        ),
      );
      print(user.username);
      // Navigator.pushNamed(context, profile.id,
      //     arguments: {
      //       KUsername: user!.username,
      //       KEmail: email,
      //       KAge: user!.age,
      //       KGender: user!.gender
      //     });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackbar(context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      showSnackbar(context, e.toString());
    }
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            CircleAvatar(
              child: Icon(Icons.local_activity),
              radius: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CircularProgressIndicator(backgroundColor: Colors.white),
            ),
          ])),
    );
  }
}
