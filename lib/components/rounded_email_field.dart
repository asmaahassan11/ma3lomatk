import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedEmailField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedEmailField({
    Key key,
    this.hintText,
    this.icon = Icons.email_outlined,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
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