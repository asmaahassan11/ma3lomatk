import 'package:flutter/material.dart';
import 'package:flutter_auth/components/text_field_container.dart';
import 'package:flutter_auth/constants.dart';

class ProfileField extends StatelessWidget {
  final String hintText;
  final TextEditingController Controller;
  final Function(String) onChanged;
  const ProfileField({
    Key key,
    this.hintText,
    this.Controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: Controller,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,

        style: TextStyle(
            color: Colors.indigo,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal),
        decoration: InputDecoration(
          // filled: true,
          // fillColor: Color(0xFFF5F6F9),

          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
        ),

        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'This field is required';
        //   }
        //   if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
        //     return "Please enter a valid email address";
        //   }
        //   return null;
        // },
      ),
    );
  }
}
