import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/controllers/product_controller.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async {
              controller.fetchProducts();
            },
            child: ListView.builder(
              itemCount: controller.products.length,
              itemBuilder: (context, index) {
                final products = controller.products[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(products.image),
                    ),
                    title: Text(products.title),
                    subtitle: Text(
                      "Category: ${products.category} \nDescription: ${products.description} \nPrice: ${products.price},",
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
