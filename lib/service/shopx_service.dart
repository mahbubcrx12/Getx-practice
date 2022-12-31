import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:getx_practice/model/shopx_model.dart';

class ShopxService {
  Future<List<ProductModel>> fetchProduct() async {
    List<ProductModel> productList = [];
    try {
      var link = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";
      var response =
      await http.get(Uri.parse(link));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        ProductModel productModel;
        for (var i in data) {
          productModel = ProductModel.fromJson(i);
          productList.add(productModel);
        }
        print("Order data ${data}");
        return productList;
      } else {
        return productList;
      }
    } catch (e) {
      print("Errrrrrr $e");
      return productList;
    }
  }
}

