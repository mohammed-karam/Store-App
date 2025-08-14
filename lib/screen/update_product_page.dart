import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'update_prduct';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? name, desc, image;

  String? price;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Update Product", style: TextStyle()),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                CustomTextField(
                  hint: "new name",
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: "new description",
                  onChanged: (value) {
                    desc = value;
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: "new price",
                  onChanged: (value) {
                    price = value;
                  },
                  keyBoardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  hint: "new image",
                  onChanged: (value) {
                    image = value;
                  },
                ),
                SizedBox(height: 60),
                CustomButton(
                  text: 'Update',
                  onTap: () async{
                    isLoading = true;
                    setState(() {});

                    try  {
                      await updateProduct(product);
                      print('success');
                    } catch (e) {
                      print(e.toString());
                    }

                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
   await  UpdateProductService().updateProduct(
      id: product.id!,
      title: name ?? product.title!,
      price: price ?? product.price!,
      desc: desc ?? product.description!,
      image: image ?? product.image!,
      category: product.category ?? product.category!,
    );
  }
}
