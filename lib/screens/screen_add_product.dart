import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AddProducts extends StatelessWidget {
  const AddProducts({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: InkWell(
                  onTap: () {
                    Get.to(() => const AddProducts());
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
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Product Information",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              _buildTextFormfield("Product Id"),
              _buildTextFormfield("Product Name"),
              _buildTextFormfield("Product Discription"),
              _buildTextFormfield("Product Category"),
              const SizedBox(
                height: 10.0,
              ),
              _buildSlider('Price'),
              _buildSlider('Qty'),
              const SizedBox(
                height: 10.0,
              ),
              _buildCheckBox("Recommended"),
              _buildCheckBox("Popular"),
              _buildCheckBox("Top Rated"),
              MaterialButton(
                onPressed: () {
                  log("Save Data");
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
          ),
        ),
      ),
    );
  }
}

TextFormField _buildTextFormfield(String hintText) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: hintText,
    ),
  );
}

Row _buildSlider(String title) {
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
          value: 0,
          min: 0,
          max: 200,
          divisions: 10,
          activeColor: Colors.black,
          inactiveColor: Colors.black12,
          onChanged: (value) {},
        ),
      ),
    ],
  );
}

Row _buildCheckBox(String title) {
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
        value: true,
        checkColor: Colors.black,
        activeColor: Colors.black12,
        onChanged: (value) {},
      ),
    ],
  );
}
