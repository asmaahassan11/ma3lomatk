import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class RoundedConfirmPassField extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController Controller;
  const RoundedConfirmPassField({Key key, this.onChanged, this.Controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: Controller,
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "ConfirmPassword",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          /*suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),*/
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value.isEmpty) return 'Required !';

          if (value != Controller.text) return 'Not Match';
          return null;
        },
      ),
    );
  }
}
