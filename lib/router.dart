import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orion/features/home/screens/home_screen.dart';
import 'package:orion/features/practice/screens/new_practice_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/practice',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        fullscreenDialog: true,
        child: const NewPracticeScreen(),
      ),
    ),
    // GoRoute(path: '/practice', builder: (context, state) => PracticeScreen()),
  ],
);
