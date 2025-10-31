import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Practice Screen')),
      backgroundColor: Colors.red,
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go to the Home screen'),
        ),
      ),
    );
  }
}
