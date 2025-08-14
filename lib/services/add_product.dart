import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProduct {
  Future<ProductModel> addProduct({
    required String title,
    required num price,
    required String desc,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> product = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'price': price,
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.formJson(product);
  }
}
