// lib/core/audio/audio_service.dart
import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static Future<AudioPlayer> createConfiguredPlayer() async {
    final player = AudioPlayer();
    try {
      await player.setAudioContext(
        AudioContext(
          android: AudioContextAndroid(
            isSpeakerphoneOn: false,
            stayAwake: false,
            contentType: AndroidContentType.music,
            usageType: AndroidUsageType.media,
            audioFocus: AndroidAudioFocus.gain,
          ),
          iOS: AudioContextIOS(
            category: AVAudioSessionCategory.playback,
            options: {
              AVAudioSessionOptions.defaultToSpeaker,
            },
          ),
        ),
      );
    } catch (_) {
      // لا شيء
    }
    await player.setReleaseMode(ReleaseMode.stop);
    return player;
  }
}
