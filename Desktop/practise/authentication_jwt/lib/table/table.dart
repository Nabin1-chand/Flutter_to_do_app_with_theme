import 'package:authentication_jwt/modal/tabel_module.dart';
import 'package:flutter/material.dart';

class DataShow extends StatelessWidget {
  DataShow({super.key, required this.productlist});
  final List<Product> productlist;
  @override
  Widget build(BuildContext context) {
    // print(productlist);
    return SingleChildScrollView(
        // Using scrollView for scrolling and formating
        scrollDirection: Axis.vertical,
        // using FittedBox for fitting complte table in screen horizontally.
        child: FittedBox(
            child: DataTable(
          sortColumnIndex: 1,
          showCheckboxColumn: false,
          border: TableBorder.all(width: 1.0),
          // Data columns as required by APIs data.
          columns: const [
            DataColumn(
                label: Text(
              "Country Name",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "Total Confirmed",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              "Total Death",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
          ],
          // Main logic and code for geting data and shoing it in table rows.
          rows: productlist
              .map(
                  //maping each rows with datalist data
                  (data) => DataRow(cells: [
                        DataCell(
                          Text(data.country,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500)),
                        ),
                        DataCell(Text(data.totalConfirmed.toString(),
                            style: const TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w500))),
                        DataCell(
                          Text(data.totalDeaths.toString(),
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w500)),
                        ),
                      ]))
              .toList(), // converting at last into list.
        )));
  }
}
