import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class WaveformWidget extends StatefulWidget {
  final bool isRecording;
  final double height;
  final double width;
  final Color waveColor;
  final int waveCount;

  const WaveformWidget({
    super.key,
    required this.isRecording,
    this.height = 40,
    this.width = 150,
    this.waveColor = AppColors.accentTeal,
    this.waveCount = 40,
  });

  @override
  State<WaveformWidget> createState() => _WaveformWidgetState();
}

class _WaveformWidgetState extends State<WaveformWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    if (widget.isRecording) {
      _animationController.repeat();
    }
  }

  @override
  void didUpdateWidget(WaveformWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRecording && !oldWidget.isRecording) {
      _animationController.repeat();
    } else if (!widget.isRecording && oldWidget.isRecording) {
      _animationController.stop();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.width, widget.height),
          painter: _WaveformPainter(
            animationValue: _animationController.value,
            waveColor: widget.waveColor,
            waveCount: widget.waveCount,
            isRecording: widget.isRecording,
          ),
        );
      },
    );
  }
}

class _WaveformPainter extends CustomPainter {
  final double animationValue;
  final Color waveColor;
  final int waveCount;
  final bool isRecording;

  _WaveformPainter({
    required this.animationValue,
    required this.waveColor,
    required this.waveCount,
    required this.isRecording,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = waveColor
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final centerY = size.height / 2;
    final spacing = size.width / waveCount;

    for (int i = 0; i < waveCount; i++) {
      final x = (i * spacing) + spacing / 2;

      // Calculate height based on animation and position
      double height;
      if (isRecording) {
        final phase =
            (i / waveCount) * 2 * math.pi + (animationValue * 2 * math.pi);
        height = 15 * math.sin(phase).abs();
      } else {
        height = 5; // Minimal height when not recording
      }

      final topY = centerY - height / 2;
      final bottomY = centerY + height / 2;

      canvas.drawLine(Offset(x, topY), Offset(x, bottomY), paint);
    }
  }

  @override
  bool shouldRepaint(_WaveformPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.isRecording != isRecording;
  }
}
