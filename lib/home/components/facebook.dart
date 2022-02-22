import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/social_icon.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/small_rounded_button.dart';
import 'package:flutter_auth/profile/components/profile_icon.dart';

import '../../constants.dart';

class FaceBook extends StatefulWidget {

  @override
  _FaceBookState createState() => _FaceBookState();
}

class _FaceBookState extends State<FaceBook> {
  final  Face=Icons.facebook_rounded;
  String selectedItem = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocalIcon(
          iconSrc: "assets/icons/FaceBo.svg",
          press: () {
            return onButtonPressed();
          },
        ),
        SizedBox(height: size.height * 0.01),
        Text("Facebook",
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
        Text("Facebook",
          style: TextStyle(
              color: Colors.deepPurple, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
        ),
        SocalIcon(
          iconSrc: "assets/icons/FaceBo.svg",
          press: () {},
        ),
        SizedBox(height: 10,),
          ProfileIcon(
            icon: "assets/icons/FaceBo.svg",
            text: "Facebook Profile Link",
            press: () {},
          ),
        Text(" Open the Facebook app and go to your profile. \n Your Facebook Profile Link will be at the top of your \n screen .",textAlign: TextAlign.center,
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
