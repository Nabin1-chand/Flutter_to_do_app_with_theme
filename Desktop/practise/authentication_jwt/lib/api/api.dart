import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Data {
  final url = "http://202.51.74.168:176/api/users/authenticate";
  final dio = Dio();

  void getpostApi(String username, String password) async {
    var response =
        await dio.post(url, data: {'username': username, 'password': password});
    print(response.data);
    //   final token = response.data;
    final Map<String, dynamic> decodedToken =
        JwtDecoder.decode(response.data["token"]);
    print(decodedToken);
  }
}
