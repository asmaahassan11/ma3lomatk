import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/active_nfc/WelcomeNFC.dart';
import 'package:flutter_auth/home/home1.dart';
import 'package:flutter_auth/people/components/people_icon.dart';
import 'package:flutter_auth/profile/components/profile_pic.dart';
import 'package:flutter_auth/background.dart';
import 'package:flutter_auth/profile/profile_screen.dart';
import '../../constants.dart';
import 'background.dart';

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
                          backgroundImage: AssetImage('assets/images/girl.png'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Username',
                        style:
                        TextStyle(fontSize: 18, color: Colors.deepPurple),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'username@gmail.com',
                        style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                      ),
                    ],
                  )),
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 40.0,
          // double
          title: Text("People", textAlign: TextAlign.center,),
          centerTitle: true,
          //leadingWidth: 900,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.white,
            )
          ],
        ),
        // drawer: DrawerWidget(),
        body: Background(
          child: SingleChildScrollView(
            //padding: EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.12,
                ),
                Icon(
                  Icons.supervisor_account, size: 100, color: Colors.black45,),
                SizedBox(height: 10),
                Text("People Who Reached Out!", style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                SizedBox(height: 10),
                PeopleIcon(
                  icon: "assets/images/person.png",
                  text: "Harry Potter",
                  //Stext:"322 Ma3lomaty",
                  press: () {},
                ),
                PeopleIcon(
                  icon: "assets/images/person.png",
                  text: "Harry Potter",
                  //Stext:"322 Ma3lomaty",
                  press: () {},
                ),
                PeopleIcon(
                  icon: "assets/images/person.png",
                  text: "Harry Potter",
                  //Stext:"322 Ma3lomaty",
                  press: () {},
                ),
                PeopleIcon(
                  icon: "assets/images/person.png",
                  text: "Harry Potter",
                  //Stext:"322 Ma3lomaty",
                  press: () {},
                ),
                //SizedBox(height: 100,)
              ],
            ),
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
          //padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 30, backgroundImage: NetworkImage(urlImage)),
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
