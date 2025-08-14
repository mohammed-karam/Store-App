import 'package:flutter/material.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/services/get_all_categories_service.dart';
import 'package:store_app/widgets/custom_category_element.dart';

class AllCategoriesPage extends StatefulWidget {
  const AllCategoriesPage({super.key});
  static String id = 'all_categories';
  @override
  State<AllCategoriesPage> createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Categories", style: TextStyle()),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: GetAllCategoriesService().getAllCategories(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                ),
                itemCount: asyncSnapshot.data!.length,
                itemBuilder: (context, index) {
                  return CustomCategoryElement(
                    title: asyncSnapshot.data![index],
                  );
                },
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
