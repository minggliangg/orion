import 'package:flutter/material.dart';

/// Orion Brand & UI Kit Color Palette
class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // Primary Colors
  static const Color primaryIndigo = Color(0xFF4F46E5);
  static const Color accentTeal = Color(0xFF2DD48F);
  static const Color highlightCoral = Color(0xFFF87171);
  static const Color neutralSlate = Color(0xFFD8D8E0);

  // Background Colors
  static const Color backgroundDark = Color(0xFF1E1E2E);
  static const Color cardBackground = Color(0xFF252538);
  static const Color cardBackgroundSecondary = Color(0xFF2A2A3E);

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E8E9E);
  static const Color textTertiary = Color(0xFF6B6B7B);

  // Accent Colors
  static const Color accentPurple = Color(0xFF6C63FF);
  static const Color accentPurpleLight = Color(0xFF5A52E0);
  static const Color accentRed = Color(0xFFFF6B6B);
  static const Color accentGreen = Color(0xFF4CAF50);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    accentPurple,
    accentPurpleLight,
  ];

  // Shadow Colors
  static Color shadowLight = Colors.black.withValues(alpha: 0.2);
  static Color shadowMedium = Colors.black.withValues(alpha: 0.3);
  static Color shadowDark = Colors.black.withValues(alpha: 0.4);

  // Utility method to create color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withValues(alpha: opacity);
  }
}
