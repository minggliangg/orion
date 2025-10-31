import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/widgets/prompt_card.dart';
import '../../../shared/widgets/timer_display.dart';
import '../../../shared/widgets/waveform_widget.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen>
    with TickerProviderStateMixin {
  late AnimationController _timerController;
  late AnimationController _backgroundAnimationController;
  Duration _elapsedTime = Duration.zero;
  bool _isRecording = false;

  final List<String> _prompts = [
    'Tell me about a time you led a project.',
    'Describe your biggest professional achievement.',
    'How do you handle stress at work?',
    'What is your leadership style?',
    'Tell me about a challenge you overcame.',
  ];

  final _currentPromptIndex = 3;

  @override
  void initState() {
    super.initState();
    _timerController = AnimationController(
      duration: const Duration(hours: 1),
      vsync: this,
    );

    _backgroundAnimationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _timerController.dispose();
    _backgroundAnimationController.dispose();
    super.dispose();
  }

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
      if (_isRecording) {
        _timerController.forward();
      } else {
        _timerController.stop();
      }
    });
  }

  void _exitPractice() {
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          // Animated background with geometric pattern
          _buildAnimatedBackground(),

          // Main content
          SafeArea(
            child: Column(
              children: [
                // Header with close button
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        color: AppColors.textPrimary,
                        iconSize: 28,
                        onPressed: _exitPractice,
                      ),
                      const Text(
                        'Practice Session',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                          fontFamily: 'Lexend',
                        ),
                      ),
                      const SizedBox(width: 48),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Prompt card
                PromptCard(
                  prompt: _prompts[_currentPromptIndex],
                  onHintTap: () {
                    // TODO: Show STAR hints
                  },
                ),
                const SizedBox(height: 40),

                // Timer display
                AnimatedBuilder(
                  animation: _timerController,
                  builder: (context, child) {
                    _elapsedTime = Duration(
                      milliseconds:
                          (_timerController.value *
                                  Duration(hours: 1).inMilliseconds)
                              .toInt(),
                    );
                    return TimerDisplay(duration: _elapsedTime);
                  },
                ),
                const SizedBox(height: 20),

                // Waveform visualization
                WaveformWidget(
                  isRecording: _isRecording,
                  height: 40,
                  width: 120,
                ),
                const Spacer(),

                // Record/Stop button
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: GestureDetector(
                    onTap: _toggleRecording,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: _isRecording
                            ? AppColors.accentRed
                            : AppColors.accentRed.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accentRed.withValues(alpha: 0.4),
                            blurRadius: 20,
                            spreadRadius: 2,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _toggleRecording,
                          borderRadius: BorderRadius.circular(28),
                          child: Center(
                            child: Icon(
                              _isRecording ? Icons.stop : Icons.stop_outlined,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedBackground() {
    return AnimatedBuilder(
      animation: _backgroundAnimationController,
      builder: (context, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: _BackgroundPainter(
            animationValue: _backgroundAnimationController.value,
          ),
        );
      },
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final double animationValue;

  _BackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = AppColors.textSecondary.withValues(alpha: 0.1)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const spacing = 80.0;

    // Draw animated vertical lines that move smoothly
    for (int i = -2; i < 12; i++) {
      final x = (i * spacing) + (animationValue * spacing);
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }

    // Draw animated horizontal lines that move smoothly
    for (int j = -2; j < 12; j++) {
      final y = (j * spacing) + (animationValue * spacing);
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // Draw animated dots at grid intersections
    final dotPaint = Paint()
      ..color = AppColors.accentTeal.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;

    for (int i = -2; i < 12; i++) {
      for (int j = -2; j < 12; j++) {
        final x = (i * spacing) + (animationValue * spacing);
        final y = (j * spacing) + (animationValue * spacing);
        if (x > -30 && x < size.width + 30 && y > -30 && y < size.height + 30) {
          canvas.drawCircle(Offset(x, y), 2, dotPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(_BackgroundPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
