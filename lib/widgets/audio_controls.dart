// lib/ui/widgets/audio_controls.dart
import 'package:flutter/material.dart';
import '../../core/audio/hadeth_audio_controller.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioControls extends StatelessWidget {
  const AudioControls({super.key, this.primary});

  final Color? primary;

  @override
  Widget build(BuildContext context) {
    final c = HadethAudioScope.of(context);
    final isPlaying = c.playerState == PlayerState.playing;
    final isCompleted = c.isReady && c.position >= c.duration && c.duration > Duration.zero;

    final color = primary ?? Theme.of(context).colorScheme.primary;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.replay_10),
          iconSize: 34,
          onPressed: (!c.isReady || c.duration == Duration.zero)
              ? null
              : () => c.seekRelative(const Duration(seconds: -10)),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: c.isLoading
              ? const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(strokeWidth: 3, color: Colors.white),
                )
              : IconButton(
                  icon: Icon((isPlaying && !isCompleted) ? Icons.pause : Icons.play_arrow),
                  color: Colors.white,
                  iconSize: 40,
                  onPressed: c.playPause,
                ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.forward_10),
          iconSize: 34,
          onPressed: (!c.isReady || c.duration == Duration.zero)
              ? null
              : () => c.seekRelative(const Duration(seconds: 10)),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Icon(c.isRepeating ? Icons.repeat_one : Icons.repeat),
          iconSize: 28,
          color: c.isRepeating ? color : null,
          onPressed: c.toggleRepeat,
        ),
      ],
    );
  }
}
