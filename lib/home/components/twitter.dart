import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/social_icon.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/small_rounded_button.dart';
import 'package:flutter_auth/profile/components/profile_icon.dart';

import '../../constants.dart';

class Twitter extends StatefulWidget {

  @override
  _TwitterState createState() => _TwitterState();
}

class _TwitterState extends State<Twitter> {
  String selectedItem = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocalIcon(
          iconSrc: "assets/icons/icon_twitter.svg",
          press: () {
            return onButtonPressed();
          },
        ),
        SizedBox(height: size.height * 0.01),
        Text("Twitter",
          style: TextStyle(
              color: Colors.deepPurple, fontSize: 14, fontWeight: FontWeight.w800, fontStyle: FontStyle.normal),
        ),
      ],
    );
  }
  void onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.grey,
            height: 400,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                ),
              ),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Twitter",
          style: TextStyle(
              color: Colors.deepPurple, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
        ),
        SocalIcon(
          iconSrc: "assets/icons/icon_twitter.svg",
          press: () {},
        ),
        SizedBox(height: 10,),
        ProfileIcon(
          icon: "assets/icons/icon_twitter.svg",
          text: "Twitter Username",
          press: () {},
        ),
        Text(" Open the Twitter app and go to your profile. \n Your Twitter Username will be at the top of your \n screen .",textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black45,),),
        //SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmallRoundedButton(
              text: "Open",
              color: kPrimaryLightColor,
              textColor: Colors.deepPurple,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(width: size.width * 0.01,),
            SmallRoundedButton(
              text: "Close",
              color: kPrimaryLightColor,
              textColor: Colors.deepPurple,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        // SizedBox(height: 10,),
        RoundedButton(
          text: "Save",
          //color: kPrimaryLightColor,
          textColor: Colors.white,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  // return SignUpScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      selectedItem = name;
    });
  }
}
