import 'dart:developer';

import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response = await Api().get(url: kProductsUrl);
      List<ProductModel> products = [];

      for (var item in response) {
        ProductModel productModel = ProductModel.formJson(item);
        products.add(productModel);
      }
      // print('ali');
      return products;
    } catch (e) {
      log('Error parsing product: $e');
      rethrow;
    }
  }
}
