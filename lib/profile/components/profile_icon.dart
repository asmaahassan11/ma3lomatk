import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/small_social_icon.dart';
import 'package:flutter_auth/Screens/Login/components/social_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    Key key,
    this.text,
    this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  //final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
           primary: Colors.deepPurple,
          padding: EdgeInsets.all(20),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SmallSocalIcon(
              iconSrc: icon,
              press: () {},
               ),
            //SizedBox(width: 20),
            Expanded(child: Text(
              text, style: TextStyle(
                color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
            )),
            Icon(Icons.close, color: Colors.black45,),
          ],
        ),
      ),
    );
  }
}
