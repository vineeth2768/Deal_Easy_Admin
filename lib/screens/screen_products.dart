import 'package:deal_easy_admin/controllers/product_controller.dart';
import 'package:deal_easy_admin/models/product_model.dart';
import 'package:deal_easy_admin/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: InkWell(
                onTap: () {
                  Get.to(() => AddProducts());
                },
                child: Card(
                  elevation: 5,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_circle,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Add a New Product",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    itemCount: productController.products.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 240,
                        child: ProductCard(
                          index: index,
                          product: productController.products[index],
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  ProductCard({
    super.key,
    required this.product,
    required this.index,
  });

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 40,
                            child: Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Slider(
                            value: product.price!,
                            min: 0,
                            max: 400,
                            divisions: 10,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black12,
                            onChanged: (value) {
                              productController.updateProductPrice(
                                index,
                                product,
                                value,
                              );
                            },
                            onChangeEnd: (value) {
                              productController.saveNewProductPrice(
                                  product, 'price', value);
                            },
                          ),
                          Expanded(
                            child: Text(
                              product.price!.toStringAsFixed(1),
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 40,
                            child: Text(
                              "Qty",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Slider(
                            value: product.quantity!.toDouble(),
                            min: 0,
                            max: 200,
                            divisions: 10,
                            activeColor: Colors.black,
                            inactiveColor: Colors.black12,
                            onChanged: (value) {
                              productController.updateProductQuantity(
                                index,
                                product,
                                value.toInt(),
                              );
                            },
                            onChangeEnd: (value) {
                              productController.saveNewProductQuantity(
                                  product, 'quantity', value.toInt());
                            },
                          ),
                          Expanded(
                            child: Text(
                              '${product.quantity}',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
