import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screen/update_product_page.dart';
import 'package:store_app/services/update_product.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductPage.id,
          arguments: productModel,
        );
      },
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 220,
              height: 180,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey.withValues(alpha: 0.2),
                    offset: Offset(10, 10),
                    spreadRadius: 0,
                  ),
                ],
              ),

              child: Card(
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image.network(src),
                      Text(
                        productModel.title ?? "no title",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      // SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$${productModel.price}'),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_outline_rounded),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 60,
              bottom: 120,
              child: Image.network(
                productModel.image ??
                    'https://n4.sdlcdn.com/imgs/g/o/p/school-bag-SDL054519274-1-3ebd7.JPG',
                width: 100,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
