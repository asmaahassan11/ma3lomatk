import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/active_nfc/Active_NFC.dart';
import 'package:flutter_auth/active_nfc/WelcomeNFC.dart';
import 'package:flutter_auth/active_nfc/active_nfc.dart';
import 'package:flutter_auth/home/home1.dart';
import 'package:flutter_auth/profile/profile_screen.dart';

import '../../constants.dart';

class DrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Sarah Abs';
    final email = 'sarah@abs.com';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          extendBodyBehindAppBar: true,
          drawer: Drawer(
            // backgroundColor: Colors.purple[300],
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(

                          width: 70,
                          height: 70,
                          child: CircleAvatar(
                            backgroundImage:
                            AssetImage('assets/images/girl.png')
                            ,),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Username',
                          style: TextStyle(fontSize: 18,color: Colors.deepPurple),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'username@gmail.com',
                          style: TextStyle(fontSize: 14,color: Colors.blueGrey),
                        ),
                      ],)
                ),
                buildMenuItem(
                  text: 'Home',
                  icon: Icons.home_outlined,
                  onClicked: () => selectedItem(context, 0),
                ),
                buildMenuItem(
                  text: 'Edit Profile',
                  icon: Icons.mode_edit,
                  onClicked: () => selectedItem(context, 1),
                ),
                buildMenuItem(
                  text: 'Active NFC',
                  icon: Icons.power_settings_new,
                  // onClicked: Active_NFC();
                  onClicked: () => selectedItem(context, 2),
                ),
                buildMenuItem(
                  text: 'Contact Us',
                  icon: Icons.contact_mail,
                  onClicked: () => selectedItem(context, 3),
                ),
                buildMenuItem(
                  text: 'Logout',
                  icon: Icons.logout,
                  onClicked: () => selectedItem(context, 4),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget buildHeader({
    @required String urlImage,
    @required String name,
    @required String email,
    @required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.deepPurple),
                  ),
                ],
              ),
              Spacer(),
              /*CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.deepPurple),
              )*/
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    @required String text,
    @required IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.deepPurple;
    final hoverColor = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Home(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => WelcomeNFC(),
        ));
        break;
        case 4:
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ));
          break;
    }
  }
}
