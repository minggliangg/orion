import 'package:flutter/material.dart';
import 'package:orion/shared/constants/app_colors.dart';
import 'package:orion/shared/widgets/stat_card.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        StatCard(
          icon: Icons.local_fire_department,
          label: 'Practice Streak',
          value: '12 Days',
          iconColor: AppColors.accentRed,
        ),

        // Total Drills Card
        StatCard(
          icon: Icons.repeat,
          label: 'Total Drills',
          value: '58',
          iconColor: AppColors.accentPurple,
        ),

        // Confidence Delta Card
        StatCard(
          icon: Icons.trending_up,
          label: 'Confidence Delta',
          value: '+15%',
          iconColor: AppColors.accentGreen,
        ),
      ],
    );
  }
}
