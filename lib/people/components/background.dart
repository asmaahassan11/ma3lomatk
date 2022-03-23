import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              "assets/images/logo3.png",
              width: size.width * 0.35,
              fit: BoxFit.fill,
            ),
          ),
          child,
          //SizedBox(height: 50,)
        ],
      ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 65,
            right: 30,
            child: FloatingActionButton(
              backgroundColor: kPrimaryLightColor,
              heroTag: 'person',
              onPressed: () {/* Do something */},
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.deepPurple,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 30,
            child: FloatingActionButton(
              backgroundColor: kPrimaryLightColor,
              heroTag: 'unit',
              onPressed: () {/* Do something */},
              child: const Icon(
                Icons.ac_unit_rounded,
                size: 40,
                color: Colors.deepPurple,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }
}
