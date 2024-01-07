import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:outland/util/constants.dart';
import 'package:outland/view/helen/helen_page.dart';
import 'package:outland/view/jimmy/jimmy_page.dart';
import 'package:outland/view/tom/tom_page.dart';
import 'package:outland/view/wendy/wendy_page.dart';

import '../view/andy_page/andy_page.dart';
import '../view/home/home_page.dart';

class AppRouter {

  static GoRouter get router => _router;

  static const root = "/";

  static final GoRouter _router = GoRouter(
      initialLocation: root,
      routes: <RouteBase>[
        GoRoute(
          path: root,
          builder: (context, state) => const MyHomePage(),
        ),
        GoRoute(
          path: '$root${Constants.andy}',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const AndyPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(CurveTween(curve: Curves.decelerate).animate(animation)),
                    child: child,
                  );
                },
              );
            }
        ),
        GoRoute(
          path: '$root${Constants.jimmy}',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const JimmyPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(CurveTween(curve: Curves.linearToEaseOut).animate(animation)),
                    child: child,
                  );
                },
              );
            }
        ),
        GoRoute(
          path: '$root${Constants.wendy}',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const WendyPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(CurveTween(curve: Curves.slowMiddle).animate(animation)),
                    child: child,
                  );
                },
              );
            }
        ),
        GoRoute(
          path: '$root${Constants.tom}',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: const TomPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: Tween<double>(begin: 0, end: 1).animate(CurveTween(curve: Curves.bounceInOut).animate(animation)),
                    child: child,
                  );
                },
              );
            }
        ),
        GoRoute(
          path: '$root${Constants.helen}',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: const HelenPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: Tween<double>(begin: 0, end: 1).animate(CurveTween(curve: Curves.easeInOut).animate(animation)),
                  child: child,
                );
              },
            );
          }
        ),
     ],
  );

}