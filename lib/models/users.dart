import 'package:cloud_firestore/cloud_firestore.dart';

class UserM {
  String username;
  String email;
  String phone;
  String password;
  String rePassword;
  String imageUrl;

  UserM(
      {this.username,
      this.email,
      this.phone,
      this.password,
      this.rePassword,
      this.imageUrl});

  UserM.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phone = json['phone'];

    password = json['password'];
    rePassword = json['rePassword'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['rePassword'] = this.rePassword;
    data['imageUrl'] = this.imageUrl;

    return data;
  }
}
