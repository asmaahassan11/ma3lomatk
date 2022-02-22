import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class SmallRoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const SmallRoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.39,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return
      ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: textColor,),
        ),
        onPressed: press,
        style: ElevatedButton.styleFrom(
            primary: color,
            padding: EdgeInsets.symmetric(horizontal: 35, vertical: 18),
            textStyle: TextStyle(
                color: Colors.deepPurple, fontSize: 14, fontWeight: FontWeight.w700)),
      );
  }
}
