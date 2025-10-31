import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class TimerDisplay extends StatelessWidget {
  final Duration duration;
  final TextStyle? style;

  const TimerDisplay({
    super.key,
    required this.duration,
    this.style,
  });

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes;
    final seconds = d.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(duration),
      style: style ??
          const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
            fontFamily: 'Lexend',
            letterSpacing: 2,
          ),
    );
  }
}
