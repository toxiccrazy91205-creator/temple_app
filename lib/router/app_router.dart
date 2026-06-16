import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/splash_screen.dart';
import '../screens/main_shell.dart';
import '../screens/home_screen.dart';
import '../screens/temple_info_screen.dart';
import '../screens/pooja_donations_screen.dart';
import '../screens/chants_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MainShell(child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: '/temple',
          builder: (BuildContext context, GoRouterState state) {
            return const TempleInfoScreen();
          },
        ),
        GoRoute(
          path: '/pooja',
          builder: (BuildContext context, GoRouterState state) {
            return const PoojaDonationsScreen();
          },
        ),
        GoRoute(
          path: '/chants',
          builder: (BuildContext context, GoRouterState state) {
            return const ChantsScreen();
          },
        ),
      ],
    ),
  ],
);
