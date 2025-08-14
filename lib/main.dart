import 'package:flutter/material.dart';
import 'package:store_app/screen/all_categories_page.dart';
import 'package:store_app/screen/home_page.dart';
import 'package:store_app/screen/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id : (context) => HomePage(),
        UpdateProductPage.id : (context) => UpdateProductPage(),
        AllCategoriesPage.id : (context) => AllCategoriesPage()

      },
      initialRoute: AllCategoriesPage.id,
    );
  }
}
