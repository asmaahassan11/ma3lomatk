import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/common_person_image.dart';
import 'package:flutter_auth/components/small_rounded_button.dart';
import 'package:flutter_auth/components/textField.dart';
import 'package:flutter_auth/home/home1.dart';
import 'package:flutter_auth/models/users.dart';
import 'package:flutter_auth/profile/components/background.dart';
import 'package:flutter_auth/util/attach_image.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../util/firebase_api.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    this.text,
    this.icon,
    this.press,
  }) : super(key: key);

  final String? text, icon;
  final VoidCallback? press;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController usernameController = TextEditingController(text: user?.username);
  final TextEditingController emailController = TextEditingController(text: user?.email);
  final TextEditingController passwordController = TextEditingController(text: user?.password);
  final TextEditingController phoneController = TextEditingController(text: user?.phone);

  final TextEditingController rePasswordController = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 40.0,
          // double
          title: Text(
            "Profile",
            textAlign: TextAlign.center,
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios_outlined),
                onPressed: () {
                  //press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ),
                  );
                  //},
                },
                //tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          // leading: Icon(Icons.arrow_back_ios_outlined),
          centerTitle: true,
        ),
        body: Background(
          child: SingleChildScrollView(
              //padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.186,
              ),
              CommonPersonImage(
                  imageFile: image,
                  imageUrl: user?.imageUrl,
                  size: 100,
                  canEdit: true,
                  onEdit: () async {
                    String? _path = await onPickImagesPressed(context);
                    if (_path != null) {
                      setState(() {
                        image = File(_path);
                      });
                    }
                  }),
              // ProfilePic(),
              SizedBox(height: 20),
              ProfileField(Controller: usernameController),
              ProfileField(Controller: emailController),
              ProfileField(Controller: phoneController),
              ProfileField(Controller: passwordController),

              SmallRoundedButton(
                text: "Update",
                press: () async {
                  _saveChanges();
                  // user = UserM.fromJson(
                  //     value.docs[0].data() as Map<String, dynamic>);
                },
              ),

              // ProfileMenu(
              //   text: user.username,
              //   icon: "assets/icons/User Icon.svg",
              //   press: () => {},
              // ),
              // ProfileMenu(
              //   text: user.email,
              //   icon: "assets/icons/Bell.svg",
              //   press: () {},
              // ),
              // ProfileMenu(
              //   text: user.phone,
              //   icon: "assets/icons/Settings.svg",
              //   press: () {},
              // ),
              // ProfileMenu(
              //   text: user.password,
              //   icon: "assets/icons/Question mark.svg",
              //   press: () {},
              // ),
              // Text(
              //   "Social Media Accounts",
              //   style: TextStyle(
              //       fontWeight: FontWeight.bold, color: Colors.black45),
              // ),
              // ProfileIcon(
              //   icon: "assets/icons/FaceBo.svg",
              //   text: "Facebook Profile Link",
              //   press: () {},
              // ),
              // ProfileIcon(
              //   icon: "assets/icons/instagram-round.svg",
              //   text: "Instagram Username",
              //   press: () {},
              // ),
              // ProfileIcon(
              //   icon: "assets/icons/snapchat-round.svg",
              //   text: "Snapchat Username",
              //   press: () {},
              // ),
            ],
          )),
        ),
      ),
    );
  }

  _saveChanges() {
    if (image != null) {
      _uploadProfileImage();
    } else {
      _uploadUserData();
    }
  }

  _uploadProfileImage() async {
    if (image != null) {
      final fileName = basename(image!.path);
      final value = await FirebaseFirestore.instance
          .collection('users')
          .where(KEmail, isEqualTo: user?.email)
          .where(KPassword, isEqualTo: user?.password)
          .snapshots()
          .first
          .then((QuerySnapshot snapshot) {
        return snapshot.docs[0].reference;
      });

      final destination = 'profileImages/${value.id}';
      UploadTask? _task = FirebaseApi.uploadFile(destination, image!);
      if (_task == null) return;

      _getImageURL(_task);
    }
  }

  _getImageURL(UploadTask? _task) async {
    final snapshot = await _task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('download link : $urlDownload');
    _uploadUserData(imageURL: urlDownload);
  }

  _uploadUserData({String? imageURL}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emailController.text);
    prefs.setString('password', passwordController.text);

    final value = await FirebaseFirestore.instance
        .collection('users')
        .where(KEmail, isEqualTo: user?.email)
        .where(KPassword, isEqualTo: user?.password)
        .snapshots()
        .first
        .then((QuerySnapshot snapshot) {
      return snapshot.docs[0].reference;
    });


    FirebaseFirestore.instance.collection('users').doc(value.id).update({
      KUsername: usernameController.text,
      KEmail: emailController.text,
      KPhone: phoneController.text,
      KImg: imageURL,
      KPassword: passwordController.text,
    }).then((value) async {
      QuerySnapshot value = await FirebaseFirestore.instance
          .collection('users')
          .where(KEmail, isEqualTo: user?.email)
          .where(KPassword, isEqualTo: user?.password)
          .snapshots()
          .first;
      user = UserM.fromJson(value.docs[0].data() as Map<String, dynamic>);
      setState(() {});
    });
  }

}
