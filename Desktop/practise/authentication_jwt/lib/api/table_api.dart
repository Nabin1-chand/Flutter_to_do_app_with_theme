import 'dart:convert';

import 'package:authentication_jwt/modal/tabel_module.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class TableData {
  Future<List<Product>> generatedProductList() async {
    var respone =
        await http.get(Uri.parse('https://api.covid19api.com/summary'));
    //  print(respone.body);
    var decodedata = jsonDecode(respone.body);
    var countrieslist = decodedata["Countries"];
    // print(decodedata);
    // var data = jsonDecode(respone.body);
//    var productlist = Product.fromJson(data);

    List<Product> item =
        countrieslist.map<Product>((item) => Product.fromJson(item)).toList();

    // print(item[2].shipCountry);
    return item;
  }
}
