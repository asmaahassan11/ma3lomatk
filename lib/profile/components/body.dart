import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/home/home1.dart';
import 'package:flutter_auth/profile/components/profile_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth/profile/components/background.dart';
import '../../constants.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    this.text,
    this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 40.0, // double
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
              children: [
                SizedBox(
                  height: size.height * 0.186,
                ),
                ProfilePic(),
                SizedBox(height: 20),
                ProfileMenu(
                  text: user.username,
                  icon: "assets/icons/User Icon.svg",
                  press: () => {},
                ),
                ProfileMenu(
                  text: user.email,
                  icon: "assets/icons/Bell.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: user.phone,
                  icon: "assets/icons/Settings.svg",
                  press: () {},
                ),
                ProfileMenu(
                  text: user.password,
                  icon: "assets/icons/Question mark.svg",
                  press: () {},
                ),
                Text(
                  "Social Media Accounts",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black45),
                ),
                ProfileIcon(
                  icon: "assets/icons/FaceBo.svg",
                  text: "Facebook Profile Link",
                  press: () {},
                ),
                ProfileIcon(
                  icon: "assets/icons/instagram-round.svg",
                  text: "Instagram Username",
                  press: () {},
                ),
                ProfileIcon(
                  icon: "assets/icons/snapchat-round.svg",
                  text: "Snapchat Username",
                  press: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void uploadImage(BuildContext context) async{

  //   try {

  //     FirebaseStorage storage =  FirebaseStorage.instanceFor(
  //     bucket: 'gs://graduation-bf501.appspot.com');
  //     Reference  ref = storage.ref().child(p.basename(image.path));

  //     UploadTask uploadTask = ref.putFile(image);

  //     TaskSnapshot taskSnapshot = await uploadTask;
  //      Scaffold.of(context).showSnackBar(SnackBar(content: Text('success'),),);
  //     String imageurl = await taskSnapshot.ref.getDownloadURL();

  //     print('url $imageurl');
  //     setState(() {
  //       imageurl = imageurl;
  //     });
  //   }
  //   catch (ex) {
  //     Scaffold.of(context).showSnackBar(SnackBar(
  //       content: Text(ex.toString()),
  //     ));
  //   }
  // }
}
