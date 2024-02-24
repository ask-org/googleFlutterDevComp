import 'package:ant_new/level_selection/game_selection.dart';
import 'package:ant_new/main_menu/main_menu_screen.dart';
import 'package:ant_new/settings/settings_screen.dart';
import 'package:ant_new/style/my_transition.dart';
import 'package:ant_new/style/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

Palette palette = Palette();

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainMenuScreen(key: Key('main menu')),
      routes: [
        GoRoute(
          path: 'play',
          pageBuilder: (context, state) => buildMyTransition<void>(
            key: const ValueKey('play'),
            color: palette.backgroundLevelSelection,
            child: const GameSelectionScreen(
              key: Key('game selection'),
            ),
          ),
        ),
        GoRoute(
          path: 'settings',
          builder: (context, state) =>
              const SettingsScreen(key: Key('settings')),
        ),
        GoRoute(
          path: 'store',
          builder: (context, state) =>
              const SettingsScreen(key: Key('settings')),
        ),
        GoRoute(
          path: 'manage',
          builder: (context, state) =>
              const SettingsScreen(key: Key('settings')),
        )
      ],
    ),
  ],
);
