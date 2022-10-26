import 'package:deal_easy_admin/screens/screen_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deal Easy Admin"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                Get.to(() => ProductScreen());
              },
              child: const Card(
                child: Center(
                  child: Text("Go To Products"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
