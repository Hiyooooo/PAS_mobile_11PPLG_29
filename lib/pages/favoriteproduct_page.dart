import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_moobile_11pplg_29/controllers/product_controller.dart';
import 'package:pas_moobile_11pplg_29/routes/routes.dart';
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';
import 'package:pas_moobile_11pplg_29/widgets/productitem_widget.dart';

class FavoriteproductPage extends StatelessWidget {
  FavoriteproductPage({super.key});

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        automaticallyImplyLeading: false,
        title: const Text(
          'Favorite Product',
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

          return GridView.builder(
            itemCount: favorites.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) {
              final product = favorites[index];

              return ProductTile(
                product: product,
                isFavorite: true,
                onFavoriteTap: () {
                  controller.removeFavorite(product.id);
                },
                onTap: () {
                  Get.toNamed(AppRouter.detailproductpage, arguments: product);
                },
              );
            },
          );
        }),
      ),
    );
  }
}
