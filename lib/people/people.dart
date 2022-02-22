import 'package:flutter/material.dart';

import '../constants.dart';
import 'components/body.dart';
//import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
//import 'package:shop_app/enums.dart';


class PeopleScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
      //bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
  }
}
