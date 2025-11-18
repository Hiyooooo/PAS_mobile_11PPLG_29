import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/controllers/product_controller.dart';
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';
import 'package:pas_moobile_11pplg_29/widgets/productitem_widget.dart';

class FavoriteproductPage extends StatelessWidget {
  FavoriteproductPage({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        automaticallyImplyLeading: false,
        title: const Text(
          'Favorite Products',
          style: TextStyle(
            color: AppColors.surface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          final favorites = controller.favoriteProducts;

          if (favorites.isEmpty) {
            return const Center(child: Text('No favorite products yet.'));
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final product = favorites[index];

              return ProductTile(
                product: product,
                isFavorite: true,
                onFavoriteTap: () {
                  controller.removeFavorite(product.id);
                },
              );
            },
          );
        }),
      ),
    );
  }
}
