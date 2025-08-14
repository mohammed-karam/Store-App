import 'package:store_app/constants.dart';
import 'package:store_app/helper/api.dart';

class GetAllCategoriesService {
  Future<List<String>> getAllCategories() async {
    List<dynamic> data = await Api().get(url: kCategoryUrl);
    List<String> finalData = [];
    for (var element in data) {
      finalData.add(element.toString());
    }
    return finalData;
  }
}
