import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:orion/shared/constants/app_colors.dart';
import 'package:orion/shared/riverpods/stopwatch_notifier.dart';

class NewPracticeScreen extends ConsumerStatefulWidget {
  const NewPracticeScreen({super.key});

  @override
  ConsumerState<NewPracticeScreen> createState() => _NewPracticeScreenState();
}

class _NewPracticeScreenState extends ConsumerState<NewPracticeScreen> {
  bool hasStarted = false;

  @override
  Widget build(BuildContext context) {
    final elapsed = ref.watch(stopwatchProvider);
    final stopwatchNotifier = ref.read(stopwatchProvider.notifier);

    void recordOnPress() {
      if (hasStarted) {
        stopwatchNotifier.stop();
      } else {
        stopwatchNotifier.start();
      }
      setState(() {
        hasStarted = !hasStarted;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
        elevation: 0,
        title: const Text(
          'New Practice Session',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontFamily: 'Lexend',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundDark,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.cardBackground.withAlpha(50),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.textSecondary.withValues(alpha: 0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tell me a time you led a project.',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                  Text(
                    'Tap for STAR hints',
                    style: TextStyle(color: AppColors.textPrimary),
                  ),
                ],
              ),
            ),
            Text(
              elapsed.toString().padLeft(2, '0'),
              style: TextStyle(color: AppColors.textPrimary, fontSize: 48),
            ),
            IconButton(
              iconSize: 72,
              color: AppColors.accentRed,
              onPressed: recordOnPress,
              icon: Icon(hasStarted ? Icons.stop : Icons.fiber_manual_record),
            ),
          ],
        ),
      ),
    );
  }
}
