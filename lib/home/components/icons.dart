import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class Icons extends StatelessWidget {
  final IconData icon;
  final VoidCallback? press;
  final Color color, textColor;
  const Icons({
    Key? key,
   required this.icon,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: Icon(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget Icon() {
    return
      Icons(
        icon: icon
      );
  }
}
