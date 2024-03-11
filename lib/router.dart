import 'package:ant_new/level_selection/game_selection.dart';
import 'package:ant_new/main_menu/main_menu_screen.dart';
import 'package:ant_new/scene/Card.dart';
import 'package:ant_new/scene/Scout.dart';
import 'package:ant_new/scout/choose_player.dart';
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
            child: const GameSelectionScreen(),
          ),
        ),
        GoRoute(
          path: 'choosePlayer',
          pageBuilder: (context, state) => buildMyTransition(
              child: const ChoosePlayerPage(), color: palette.backgroundMain),
        ),
        GoRoute(
          path: 'dungeon',
          pageBuilder: (context, state) => buildMyTransition(
              child: const ScoutPage(), color: palette.backgroundMain),
        ),
        GoRoute(
          path: 'card',
          pageBuilder: (context, state) => buildMyTransition(
              child: const CardPage(), color: palette.backgroundMain),
        ),
        GoRoute(
          path: 'settings',
          pageBuilder: (context, state) => buildMyTransition(
              child: const SettingsScreen(), color: palette.backgroundSettings),
        )
      ],
    ),
  ],
);
