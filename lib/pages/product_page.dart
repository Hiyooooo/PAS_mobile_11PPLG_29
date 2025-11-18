import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/controllers/product_controller.dart';
import 'package:pas_moobile_11pplg_29/routes/routes.dart';
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';
import 'package:pas_moobile_11pplg_29/widgets/productitem_widget.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        automaticallyImplyLeading: false,
        title: const Text(
          'Products',
          style: TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = controller.products;

          if (products.isEmpty) {
            return const Center(child: Text('No products.'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              controller.fetchProducts();
            },
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.68,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                final isFav = controller.isFavorite(product.id);

                return ProductTile(
                  product: product,
                  isFavorite: isFav,
                  onFavoriteTap: () => controller.toggleFavorite(product.id),
                  onTap: () {
                    Get.toNamed(
                      AppRouter.detailproductpage,
                      arguments: product,
                    );
                  },
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
