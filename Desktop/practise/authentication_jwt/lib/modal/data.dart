import 'dart:convert';

class Data {
  String fullname;
  String email;
  String bankId;
  String usertype;

  Data(
      {required this.fullname,
      required this.email,
      required this.bankId,
      required this.usertype});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fullname: json["fullname"],
        email: json["email"],
        bankId: json["bankId"],
        usertype: json["usertype"],
      );
}
