import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Login/login_screen.dart';
import 'package:flutter_auth/Screens/Signup/components/background.dart';
import 'package:flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_confirm-pass_field.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_email_field.dart';
import 'package:flutter_auth/components/rounded_mobile_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/home/components/body.dart';
import 'package:flutter_auth/home/home1.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  static String username, email, phone, password, rePassword;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  FirebaseAuth instance = FirebaseAuth.instance;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
        stream: users
            .where('email', isEqualTo: email)
            .where('password', isEqualTo: password)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: size.height * 0.03),
                      SvgPicture.asset(
                        "assets/icons/signup.svg",
                        height: size.height * 0.35,
                      ),
                      RoundedInputField(
                        Controller: usernameController,
                        hintText: "UserName",
                        onChanged: (value) {
                          username = value;
                        },
                      ),
                      RoundedEmailField(
                        Controller: emailController,
                        hintText: "Email",
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                      RoundedMopileField(
                        Controller: phoneController,
                        hintText: "Mobile Number",
                        onChanged: (value) {
                          phone = value;
                        },
                      ),
                      RoundedPasswordField(
                        Controller: passwordController,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                      RoundedConfirmPassField(
                        Controller: rePasswordController,
                        onChanged: (value) {
                          rePassword = value;
                        },
                      ),
                      SizedBox(height: size.height * 0.03),
                      AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        color: Colors.deepPurple,
                        shape: const CircleBorder(),
                        onPressed: () async {
                          var auth = FirebaseAuth.instance;

                          if (formkey.currentState.validate()) {
                            // islooding = true;
                            // setState(() {});
                            try {
                              await registeruser();
                              // users
                              //     .where(KEmail, isEqualTo: email)
                              //     .get()
                              //     .then((QuerySnapshot querySnapshot) {
                              //   querySnapshot.docs.forEach((doc) {
                              //     print(doc[KUsername]);
                              //     print(doc[KEmail]);
                              //     print(doc[KAge]);
                              //     print(doc[KGender]);
                              //   });
                              // });
                              // Navigator.pushNamed(context, profile.id,
                              //     arguments: {
                              //       KUsername: username,
                              //       KEmail: email,
                              //       KAge: age,
                              //       KGender: gender
                              //     });
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginScreen(),
                                ),
                              );
                              users.add({
                                KUsername: username,
                                KEmail: email,
                                KPhone: phone,
                                KPassword: password,
                                KRePassword: rePassword,
                              });
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'week-password') {
                                showSnackbar(context,
                                    'The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                showSnackbar(context,
                                    'The account already exists for that email.');
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
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Text('Loading...');
          }
        });
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> registeruser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
