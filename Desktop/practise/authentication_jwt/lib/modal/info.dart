import 'package:authentication_jwt/modal/data.dart';
import 'package:dio/dio.dart';

class UserData {
  List<Map<String, dynamic>> data = [
    {
      "fullname": "nabin",
      "email": "nbc!1.com",
      "bankId": "nbc1234",
      "usertype": "bankmember",
    },
    {
      "fullname": "nabin",
      "email": "nbc!1.com",
      "bankId": "nbc1234",
      "usertype": "bankmember",
    },
    {
      "fullname": "nabin",
      "email": "nbc!1.com",
      "bankId": "nbc1234",
      "usertype": "bankmember",
    },
  ];

  List<Data> getapi() {
    Dio().get("fromapi");
    var responsedata = data; //json

    List<Data> userdata =
        responsedata.map<Data>((userdata) => Data.fromJson(userdata)).toList();
    return userdata;
  }
}
