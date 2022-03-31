import 'package:cloud_firestore/cloud_firestore.dart';

class UserM {
  String username;
  String email;
  String phone;
  String password;
  String rePassword;
  String imageurl;
  String instagramUrl;
  String facebookUrl;
  String whatsappNumber;

  UserM({
    this.username,
    this.email,
    this.phone,
    this.password,
    this.rePassword,
    this.imageurl,
    this.facebookUrl,
    this.instagramUrl,
    this.whatsappNumber,
  });

  UserM.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phone = json['phone'];

    password = json['password'];
    rePassword = json['rePassword'];
    imageurl = json['imageurl'];
    facebookUrl = json['facebookUrl'];
    instagramUrl = json['instagramUrl'];
    whatsappNumber = json['whatsappNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['rePassword'] = this.rePassword;
    data['imageurl'] = this.imageurl;
    data['facebookUrl'] = this.facebookUrl;
    data['instagramUrl'] = this.instagramUrl;
    data['whatsappNumber'] = this.whatsappNumber;

    return data;
  }
}
