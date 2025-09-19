import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/flip_game_demo/game_play_main_screen.dart';
import 'pages/home/home_page.dart';
import 'pages/year_month_picker_demo/year_month_picker_page.dart';

class MyRouterConfig {
  MyRouterConfig._();

  static const String home = '/';
  static const String yearMonthPicker = 'year_month_picker';
  static const String flipGame = 'flip_game';

  /// The route configuration.
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: yearMonthPicker,
            builder: (BuildContext context, GoRouterState state) {
              return const YearMonthPickerPage();
            },
          ),
          GoRoute(
            path: flipGame,
            builder: (BuildContext context, GoRouterState state) {
              return const FlipGamePlayMainScreen();
            },
          ),
        ],
      ),
    ],
  );
}
