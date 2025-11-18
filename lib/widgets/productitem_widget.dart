import 'package:flutter/material.dart';
import 'package:pas_moobile_11pplg_29/models/product_model.dart';
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onTap;

  const ProductTile({
    super.key,
    required this.product,
    required this.isFavorite,
    this.onFavoriteTap,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface,
      elevation: 2,
      shadowColor: AppColors.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border, width: 0.6),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
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

              const SizedBox(height: 8),

              // Judul + icon bookmark
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: onFavoriteTap,
                    icon: Icon(
                      isFavorite ? Icons.bookmark : Icons.bookmark_border,
                      size: 18,
                      color: isFavorite
                          ? Colors.amber
                          : AppColors.textSecondary,
                    ),
                    tooltip: isFavorite
                        ? 'Remove from favorite'
                        : 'Add to favorite',
                  ),
                ],
              ),

              const SizedBox(height: 4),

              // Category
              Text(
                '${product.category}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 4),

              // Harga
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  color: AppColors.success,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
