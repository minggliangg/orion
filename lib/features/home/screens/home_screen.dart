import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orion/features/home/widgets/stats_section.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/widgets/circular_progress_widget.dart';
import '../../../shared/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Row(
                  children: [
                    const CircleAvatar(radius: 28),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Welcome back!',
                        style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: AppColors.textSecondary,
                        size: 28,
                      ),
                      onPressed: () {
                        // Navigate to settings
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Your Focus Area Section
                Text(
                  'Your Focus Area',
                  style: const TextStyle(
                    fontFamily: 'Lexend',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 24),

                // Circular Progress Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowMedium,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: CircularProgressWidget(percentage: 45, size: 220),
                  ),
                ),
                const SizedBox(height: 32),

                // Pacing & Pauses Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowMedium,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Pacing & Pauses',
                        style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Improve your delivery by mastering the\nrhythm of your speech.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 15,
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 28),
                      GradientButton(
                        text: 'Start Practice',
                        onPressed: () => context.go('/practice'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Practice Streak Card
                const StatsSection(),

                const SizedBox(height: 32),

                // Motivational Quote
                Center(
                  child: Text(
                    '"Aim higher, land better."',
                    style: const TextStyle(
                      fontFamily: 'Lexend',
                      fontSize: 16,
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
