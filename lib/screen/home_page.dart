import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'homepage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("New Trend", style: TextStyle()),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
        child: FutureBuilder<List<ProductModel>>(
          future: GetAllProductsService().getAllProducts(),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              // print(asyncSnapshot.data!);
              List<ProductModel> products = [];
              for (var product in asyncSnapshot.data!) {
                products.add(product);
              }
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 60,
                ),
                itemBuilder: (context, index) {
                  return ItemCard(productModel: products[index]);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
