class Product {
  final String id;
  final String country;
  final int totalConfirmed;
  final int totalDeaths;
  Product({
    required this.id,
    required this.country,
    required this.totalConfirmed,
    required this.totalDeaths,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["ID"],
        country: json["Country"],
        totalConfirmed: json["TotalConfirmed"],
        totalDeaths: json["TotalDeaths"],
      );
  Map<String, dynamic> toJson() => {
        "ID": id,
        "Country": country,
        "TotalConfirmed": totalConfirmed,
        "TotalDeaths": totalDeaths,
      };
}
