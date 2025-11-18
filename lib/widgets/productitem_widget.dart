import 'package:flutter/material.dart';
import 'package:pas_moobile_11pplg_29/models/product_model.dart';
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const ProductTile({
    super.key,
    required this.product,
    required this.isFavorite,
    this.onFavoriteTap,
  });

  String get categoryText {
    return product.category.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      elevation: 2,
      shadowColor: AppColors.shadow,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border, width: 0.6),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Gambar produk
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 72,
                  height: 72,
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppColors.background,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.textDisabled,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      categoryText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        color: AppColors.primaryDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // Icon bookmark
              IconButton(
                onPressed: onFavoriteTap,
                icon: Icon(
                  isFavorite ? Icons.bookmark : Icons.bookmark_border,
                  size: 22,
                  color: isFavorite ? Colors.amber : AppColors.textSecondary,
                ),
                tooltip: isFavorite
                    ? 'Remove from favorite'
                    : 'Add to favorite',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
