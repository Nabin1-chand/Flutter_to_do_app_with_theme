import 'package:authentication_jwt/api/table_api.dart';
import 'package:authentication_jwt/modal/tabel_module.dart';
import 'package:authentication_jwt/table/table.dart';
import 'package:flutter/material.dart';

class ShowData extends StatelessWidget {
  const ShowData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
        future: TableData().generatedProductList(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) {
            // checking if API has data & if no data then loading bar
            return const Center(child: CircularProgressIndicator());
          } else {
            // return data after recieving it in snapshot.
            return Container(
                padding: const EdgeInsets.all(5),
                // Data Table logic and code is in DataClass
                child: DataShow(productlist: snapshot.data as List<Product>));
          }
        });
  }
}
