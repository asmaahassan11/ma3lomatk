import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/models/users.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:flutter_auth/constants.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  TextEditingController img = TextEditingController();
  final imagePicker = ImagePicker();
  File image;
  String imageurl;
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            // backgroundImage: AssetImage("assets/images/girl.png"),
            backgroundImage: image == null ? null : FileImage(image),
            radius: 80,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 30,
              width: 30,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {
                  getImage();
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 10,
            child: Builder(
              builder: (context) => RaisedButton(
                color: Colors.white,
                onPressed: () async {
                  uploadImage(context);
                  // user= UserM(
                  //       imageurl: imageurl
                  // );
                },
                child: Text('Upload'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getImage() async {
    var img = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(img.path);
    });
  }

  void uploadImage(context) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instanceFor(
          bucket: 'gs://graduation-bf501.appspot.com');
      Reference ref = storage.ref().child(p.basename(image.path));

      UploadTask uploadTask = ref.putFile(image);

      TaskSnapshot taskSnapshot = await uploadTask;
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('success'),
        ),
      );
      String imageurl = await taskSnapshot.ref.getDownloadURL();
      // await FirebaseFirestore.instance.collection('users').add({'img' : imageurl});

      print('url $imageurl');
      setState(() {
        imageurl = imageurl;
      });
    } catch (ex) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(ex.toString()),
      ));
    }
  }
}
