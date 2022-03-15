import 'package:cloud_firestore/cloud_firestore.dart';

class UserM {
  String username;
  String email;
  String phone;
  String password;
  String rePassword;

  UserM(
      {this.username, this.email, this.phone, this.password, this.rePassword});

  UserM.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    rePassword = json['rePassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['rePassword'] = this.rePassword;

    return data;
  }
}
