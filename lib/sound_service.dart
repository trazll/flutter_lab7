// import 'dart:html' as html;

// class SoundService {
//   static html.AudioElement? _backgroundMusic;
//   static bool _isMuted = false;
//   static bool get isMuted => _isMuted;

//   static void playBackground() {
//   _backgroundMusic =
//     html.AudioElement('assets/assets/sounds/background.mp3')
//       ..loop = true
//       ..volume = 0.4;
//   if (!_isMuted) {
//     _backgroundMusic!.play();
//   }
// }

// static void _playSound(String path, {double volume = 1.0}) {
//   if (_isMuted) return;
//   html.AudioElement(path)
//   ..volume = volume
//   ..play();
// }

// static void playWin() => _playSound('assets/assets/sounds/win.mp3');
// static void playJackpot() =>
//     _playSound('assets/assets/sounds/jackpot.mp3');
// static void playLose() =>
//     _playSound('assets/assets/sounds/lose.mp3');
// static void playClick() =>
//     _playSound('assets/assets/sounds/click.mp3', volume: 0.6);

// static void toggleMute() {
//   _isMuted = !_isMuted;
//   if (_isMuted) { _backgroundMusic?.pause(); }
//   else { _backgroundMusic?.play(); }
// }
// }
import 'package:audioplayers/audioplayers.dart';

class SoundService {
  static AudioPlayer? _backgroundPlayer;
  static bool _backgroundStarted = false;
  static bool _isMuted = false;

  static final List<AudioPlayer> _sfxPool = [];
  static int _sfxIndex = 0;
  static const int _poolSize = 4;

  static bool get isMuted => _isMuted;

  static Future<void> init() async {
    for (int i = 0; i < _poolSize; i++) {
      final p = AudioPlayer();
      await p.setPlayerMode(
        PlayerMode.lowLatency,
      );
      _sfxPool.add(p);
    }
  }

  static Future<void> playBackground() async {
    if (_backgroundStarted) return;
    _backgroundPlayer = AudioPlayer();
    await _backgroundPlayer!.setReleaseMode(ReleaseMode.loop);
    await _backgroundPlayer!.setVolume(_isMuted ? 0.0 : 0.4);
    await _backgroundPlayer!.play(AssetSource('sounds/background.mp3'));
  }
  static Future<void> _playSound
}