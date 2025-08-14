
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetAllProductsForGivenCategoryService {


  Future<List<ProductModel>> getAllProductsForGivenCategory(
    String categoryName,
  ) async {
    final response = await Api().get(
      url: 'https://fakestoreapi.com/products/category/$categoryName',
    );
    List<ProductModel> products = [];
    for (var item in response) {
      ProductModel productModel = ProductModel.formJson(item);
      products.add(productModel);
    }
    return products;
  }
}
