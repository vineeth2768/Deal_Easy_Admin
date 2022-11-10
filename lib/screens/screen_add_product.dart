// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:deal_easy_admin/controllers/product_controller.dart';
import 'package:deal_easy_admin/models/product_model.dart';
import 'package:deal_easy_admin/services/database_services.dart';
import 'package:deal_easy_admin/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class AddProducts extends StatelessWidget {
  AddProducts({super.key});

  final ProductController productController = Get.find();

  StorageService storage = StorageService();
  DatabaseService database = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Products"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Obx(
            (() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      child: InkWell(
                        onTap: () async {
                          ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery);

                          if (image == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "No Image was selected!",
                                ),
                              ),
                            );
                          }
                          if (image != null) {
                            await storage.uploadImage(image);
                            var imageUrl =
                                await storage.getDownloadURL(image.name);

                            productController.newProduct.update(
                                'imageUrl', (_) => imageUrl,
                                ifAbsent: () => imageUrl);
                            log(productController.newProduct['imageUrl']);
                          }
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
                                "Add an Image",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Product Information",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    _buildTextFormfield(
                      "Product Id",
                      "id",
                      productController,
                    ),
                    _buildTextFormfield(
                      "Product Name",
                      "name",
                      productController,
                    ),
                    _buildTextFormfield(
                      "Product Description",
                      "description",
                      productController,
                    ),
                    _buildTextFormfield(
                      "Product Category",
                      "category",
                      productController,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _buildSlider(
                      'Price',
                      'price',
                      productController,
                      productController.price,
                    ),
                    _buildSlider(
                      'Quantity',
                      'quantity',
                      productController,
                      productController.quantity,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _buildCheckBox(
                      "Recommended",
                      "isRecommended",
                      productController,
                      productController.isRecommended,
                    ),
                    _buildCheckBox(
                      "Popular",
                      "isPopular",
                      productController,
                      productController.isPopular,
                    ),
                    _buildCheckBox(
                      "TopRated",
                      "isTopRated",
                      productController,
                      productController.isTopRated,
                    ),
                    MaterialButton(
                      onPressed: () {
                        database.addProduct(
                          Product(
                            id: int.parse(productController.newProduct['id']),
                            name: productController.newProduct['name'],
                            category: productController.newProduct['category'],
                            description:
                                productController.newProduct['description'],
                            imageUrl: productController.newProduct['imageUrl'],
                            isRecommended:
                                productController.newProduct['isRecommended'],
                            isPopular:
                                productController.newProduct['isPopular'],
                            isTopRated:
                                productController.newProduct['isTopRated'],
                            price: productController.newProduct['price'],
                            quantity: productController.newProduct['quantity']
                                .toInt(),
                          ),
                        );
                        log("Save Data");
                        log(productController.newProduct.toString());
                      },
                      height: 40,
                      minWidth: double.infinity,
                      color: Colors.black,
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

TextFormField _buildTextFormfield(
  String hintText,
  String name,
  ProductController productController,
) {
  return TextFormField(
    decoration: InputDecoration(hintText: hintText),
    onChanged: (value) {
      productController.newProduct.update(
        name,
        (_) => value,
        ifAbsent: (() => value),
      );
    },
  );
}

Row _buildSlider(
  String title,
  String name,
  ProductController productController,
  double? controllerValue,
) {
  return Row(
    children: [
      SizedBox(
        width: 75,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Expanded(
        child: Slider(
          value: (controllerValue == null) ? 0 : controllerValue,
          min: 0,
          max: 200,
          divisions: 10,
          activeColor: Colors.black,
          inactiveColor: Colors.black12,
          onChanged: (value) {
            productController.newProduct.update(
              name,
              (_) => value,
              ifAbsent: (() => value),
            );
          },
        ),
      ),
    ],
  );
}

Row _buildCheckBox(
  String title,
  String name,
  ProductController productController,
  bool? controllerValue,
) {
  return Row(
    children: [
      SizedBox(
        width: 120,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Checkbox(
        value: (controllerValue == null) ? false : controllerValue,
        checkColor: Colors.black,
        activeColor: Colors.black12,
        onChanged: (value) {
          productController.newProduct.update(
            name,
            (_) => value,
            ifAbsent: (() => value),
          );
        },
      ),
    ],
  );
}
