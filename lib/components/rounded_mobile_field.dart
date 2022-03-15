import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedMopileField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final Function(String) onChanged;
  final TextEditingController Controller;
  const RoundedMopileField(
      {Key key,
      this.hintText,
      this.icon = Icons.phone,
      this.onChanged,
      this.Controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: Controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Required !';
          }
          return null;
        },
      ),
    );
  }
}
