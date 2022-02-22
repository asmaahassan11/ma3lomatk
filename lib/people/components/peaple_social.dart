import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PeopleSocial extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const PeopleSocial({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: kPrimaryLightColor,
          ),
          shape: BoxShape.circle,
        ),
        child:Image(image: AssetImage(iconSrc), width: 40,height: 30,),
      ),
    );
  }
}
