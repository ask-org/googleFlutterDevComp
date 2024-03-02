import 'package:ant_new/style/my_button.dart';
import 'package:ant_new/style/palette.dart';
import 'package:ant_new/style/responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  Palette palette = Palette();
  static const _gap = SizedBox(height: 10);
  AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.setVolume(0.08);
    _audioPlayer
        .setAudioSource(AudioSource.asset(
            'assets/audio/100 Heartbound OST Meandering Shadows.mp3'))
        // ignore: body_might_complete_normally_catch_error
        .catchError((error) {
      debugPrint("Error in audio main_menu_screen $error");
    });
    _audioPlayer.play();
  }

  Widget _playerButton(PlayerState playerState) {
    final processingState = playerState.processingState;
    if (_audioPlayer.playing != true) {
      return IconButton(
        icon: const Icon(Icons.volume_off),
        iconSize: 30.0,
        onPressed: _audioPlayer.play,
      );
    } else if (processingState != ProcessingState.completed) {
      return IconButton(
        icon: const Icon(Icons.volume_up),
        iconSize: 30.0,
        onPressed: _audioPlayer.pause,
      );
    } else {
      _audioPlayer.seek(Duration.zero);
      _audioPlayer.play();
      return IconButton(
        icon: const Icon(Icons.replay),
        iconSize: 30.0,
        onPressed: () => _audioPlayer.seek(Duration.zero),
      );
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: ResponsiveScreen(
        squarishMainArea: Center(
          child: Transform.rotate(
            angle: -0.1,
            child: const Text(
              'Ant Quest',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Permanent Marker',
                fontSize: 75,
                height: 1,
              ),
            ),
          ),
        ),
        rectangularMenuArea: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              onPressed: () {
                GoRouter.of(context).push('/play');
              },
              child: const Text('Play'),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/store'),
              child: const Text('store'),
            ),
            _gap,
            MyButton(
              onPressed: () => GoRouter.of(context).push('/settings'),
              child: const Text('Settings'),
            ),
            Center(
              child: StreamBuilder<PlayerState>(
                stream: _audioPlayer.playerStateStream,
                builder: (context, snapshot) {
                  final playerState = snapshot.data;
                  return _playerButton(playerState!);
                },
              ),
            ),
            const Text(
              "\"Music by Pirate Software\"",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
