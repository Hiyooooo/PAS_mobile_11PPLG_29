import 'package:flutter/material.dart';

class AppColors {
  // Brand / utama
  static const Color primary = Color(0xFF0D47A1); // Biru tua
  static const Color primaryLight = Color(0xFF5472D3);
  static const Color primaryDark = Color(0xFF002171);

  // Latar belakang & permukaan (card, appbar, dll)
  static const Color background = Color(0xFFF4F6F9); // Abu muda
  static const Color surface = Colors.white;

  // Teks
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textDisabled = Color(0xFFBDBDBD);

  // Border & garis pemisah
  static const Color border = Color(0xFFE0E0E0);

  // Status warna (bisa dipakai di list mobil)
  static const Color success = Color(0xFF2E7D32); // contoh: mobil tersedia
  static const Color warning = Color(0xFFFFA000); // contoh: butuh servis
  static const Color error = Color(0xFFD32F2F); // contoh: data tidak valid

  // Shadow ringan untuk card
  static const Color shadow = Color(0x1A000000); // hitam dengan 10% opacity
}
