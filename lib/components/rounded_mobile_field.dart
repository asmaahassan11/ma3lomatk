import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedMopileField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController Controller;
  final Function(String) onChanged;

  const RoundedMopileField({
    Key? key,
    required this.hintText,
    required this.Controller,
    this.icon = Icons.phone,
    required this.onChanged,
  }) : super(key: key);

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
          if (value == null && value == '') {
            return 'Required !';
          }
          return null;
        },
      ),
    );
  }
}
