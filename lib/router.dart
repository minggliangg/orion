import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:orion/features/home/screens/home_screen.dart';
import 'package:orion/features/practice/screens/practice_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/practice',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return CustomTransitionPage<void>(
          key: state.pageKey,
          child: const PracticeScreen(),
          transitionDuration: const Duration(milliseconds: 150),
          transitionsBuilder:
              (
                BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child,
              ) {
                return FadeTransition(
                  opacity: CurveTween(
                    curve: Curves.easeInOut,
                  ).animate(animation),
                  child: child,
                );
              },
        );
      },
    ),
    // GoRoute(path: '/practice', builder: (context, state) => PracticeScreen()),
  ],
);
