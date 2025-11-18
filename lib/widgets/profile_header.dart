import 'package:flutter/material.dart';
import 'package:pas_moobile_11pplg_29/themes/app_color.dart';

class ProfileHeader extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String email;

  const ProfileHeader({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: Container(
            width: 96,
            height: 96,
            color: AppColors.background,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.person,
                  size: 48,
                  color: AppColors.textDisabled,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Nama
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        // Email
        Text(
          email,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
        ),
      ],
    );
  }
}
