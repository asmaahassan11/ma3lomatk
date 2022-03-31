import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/small_social_icon.dart';
import '../../../constants.dart';

// class RoundedSocial extends StatelessWidget {
//   const  RoundedSocial({
//     Key key,
//     this.icon,
//     this.hintText,
//   }) : super(key: key);
//
//   final String icon, hintText;
//
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference socials = FirebaseFirestore.instance.collection('social');
//     String name;
//     String url;
//     final messageTextController = TextEditingController();
//     return SingleChildScrollView(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: TextButton(
//           style: TextButton.styleFrom(
//             primary: Colors.deepPurple,
//             padding: EdgeInsets.all(20),
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             backgroundColor: Color(0xFFF5F6F9),
//           ),
//          // onPressed: press,
//           child: Row(
//             children: [
//               SmallSocalIcon(
//                 iconSrc: icon,
//                 press: () {},
//               ),
//               //SizedBox(width: 20),
//               Expanded(
//                   child: TextField(
//                      // obscureText: true,
//                       cursorColor: kPrimaryColor,
//                       decoration: InputDecoration(
//                         hintText: hintText,
//                         border: InputBorder.none,
//                       ),
//                     style: TextStyle(
//                         color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
//                     ),
//               ),
//               Icon(Icons.close, color: Colors.black45,),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class RoundedSocial extends StatelessWidget {
  RoundedSocial({
    Key key,
    this.icon,
    this.hintText,
  }) : super(key: key);

  final String icon, hintText;
  //String icon, hintText;
  final messageTextController = TextEditingController();
  CollectionReference socials = FirebaseFirestore.instance.collection('social');
  String name;
  //String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('socialApp').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              //if (!snapshot.hasData) return Text('Loading');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                // return new Text('Loading...');
                default:
                  return new Column(children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.deepPurple,
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Color(0xFFF5F6F9),
                      ),
                      // onPressed: press,
                      child: Row(
                        children: [
                          SmallSocalIcon(
                            iconSrc: icon,
                            press: () {},
                          ),
                          //SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              cursorColor: kPrimaryColor,
                              decoration: InputDecoration(
                                hintText: hintText,
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.normal),
                              //controller: messageTextController,
                              keyboardType: TextInputType.emailAddress,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                name = value;
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // messageTextController.clear();
                              // print('data stored to firestore');
                              // CollectionReference socials = FirebaseFirestore
                              //     .instance
                              //     .collection('users');
                              // DocumentReference ref = socials.doc('socialApp');
                              // ref.set({
                              //   'socialApp': FieldValue.arrayUnion([
                              //     {
                              //       'name': name,
                              //     },
                              //   ])
                              // }, SetOptions(merge: true));
                            },
                            icon: Icon(Icons.add),
                          ),
                          //Icon(Icons.close, color: Colors.black45,),
                        ],
                      ),
                    ),
                  ]);
              }
            },
          ),
        ],
      ),
    );
  }
}
