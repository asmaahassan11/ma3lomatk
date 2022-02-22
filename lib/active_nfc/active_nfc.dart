import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/big_social_icon.dart';
import 'package:flutter_auth/Screens/Login/components/social_icon.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/home/home1.dart';
import 'package:flutter_auth/profile/components/profile_icon.dart';

import '../../constants.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("Ready to Scan",
          style: TextStyle(
              color: Colors.deepPurple, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
        ),
        SizedBox(height: 20,),
        BigSocalIcon(
          iconSrc: "assets/icons/mobile.svg",
          press: () {},
        ),
        SizedBox(height: 20,),
        Text("   Hold a MA3LOMATK to the middle back of your phone \n to view profile. Hold the MA3LOMATK there until \n the profile appears!",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,),
        SizedBox(height: 20,),
        RoundedButton(
          text: "Cancel",
          //color: kPrimaryLightColor,
          textColor: Colors.white,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                   return Home();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
