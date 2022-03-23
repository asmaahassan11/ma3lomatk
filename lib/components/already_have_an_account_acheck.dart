import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 10),
        Text(
          login ? "\n \n Don’t have an Account ? \n \n " : "Already have an Account ? ",
          style: TextStyle(color: kPrimaryColor,),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "\n \nRegister \n \n" :"Login",
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
