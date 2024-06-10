import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../data/product_model.dart';

class ProductService {
  Future<Map<String, dynamic>> fetchAllProducts() async {
    try {
      final response = await http.get(
        Uri.parse("https://dummyjson.com/products"),
      );
      if (response.statusCode != 200) throw Exception("Internal Server Error");
      final decode = jsonDecode(response.body);
      final List<dynamic> allProducts = decode["products"];
      final products =
          allProducts.map((product) => ProductModel.fromJson(product)).toList();
      return {
        "total": decode["total"],
        "skip": decode["skip"],
        "limit": decode["limit"],
        "products": products,
      };
    } catch (e, st) {
      log("ERROR FROM FETCH ALL PRODUCTS ($e $st)");
      rethrow;
    }
  }
}
