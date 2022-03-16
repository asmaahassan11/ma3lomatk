import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../models/users.dart';

class Body extends StatelessWidget {
  String email, password;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                Controller: emailController,
                hintText: "Your Email",
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedPasswordField(
                Controller: passwordController,
                onChanged: (value) {
                  password = value;
                },
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
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('email', emailController.text);
                  prefs.setString('password', passwordController.text);
                  if (formkey.currentState.validate()) {
                    // islooding = true;
                    // setState(() {});
                    try {
                      //await loginUser(auth);

                      QuerySnapshot value = await FirebaseFirestore.instance
                          .collection('users')
                          .where(KEmail, isEqualTo: email)
                          .where(KPassword, isEqualTo: password)
                          .snapshots()
                          .first;
                      // print(value.docs[0].data());
                      user = UserM.fromJson(
                          value.docs[0].data() as Map<String, dynamic>);
                      // print(user!.username);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => Home(),
                        ),
                      );
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
                        showSnackbar(
                            context, 'Wrong password provided for that user.');
                      }
                    } catch (e) {
                      showSnackbar(context, e.toString());
                    }
                    // islooding = false;
                    // setState(() {});
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

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }
}
