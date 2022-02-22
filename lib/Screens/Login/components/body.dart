import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Login/components/small_social_icon.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/Screens/Login/components/or_divider.dart';
import 'package:flutter_auth/Screens/Login/components/social_icon.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_email_field.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/home/home1.dart';
import 'package:flutter_auth/profile/profile_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final bool login;
  Body({
    Key key,
    this.login = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Login",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedEmailField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              /*RoundedButton(
                text: "LOGIN",
                press: () {},
              ),*/
              Text(
                // login ? "                                                                                                                                                                                                   Forget Password" : "Forget Password ",

                // login ? "Forget Password" : "Forget Password ",
                login ? "Forget Password" : "Forget Password ",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: size.height * 0.03),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SmallSocalIcon(
                    iconSrc: "assets/icons/google.svg",
                    press: () {},
                  ),
                  SmallSocalIcon(
                    iconSrc: "assets/icons/icon_twitter.svg",
                    press: () {},
                  ),
                  SmallSocalIcon(
                    iconSrc: "assets/icons/FaceBo.svg",
                    press: () {},
                  ),
                  SmallSocalIcon(
                    iconSrc: "assets/icons/linkedin.svg",
                    press: () {},
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Colors.deepPurple,
                shape: const CircleBorder(),
                onPressed: () {
                  //press: () {
                  if (formkey.currentState.validate()) {
                    //press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
