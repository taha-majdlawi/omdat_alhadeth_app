// lib/ui/widgets/audio_progress_bar.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../core/audio/hadeth_audio_controller.dart';

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({super.key, this.activeColor, this.inactiveColor});

  final Color? activeColor;
  final Color? inactiveColor;

  String _fmt(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return h > 0 ? '$h:$m:$s' : '${int.parse(m)}:$s';
  }

  @override
  Widget build(BuildContext context) {
    final c = HadethAudioScope.of(context);
    final double maxValue = max<double>(c.duration.inMilliseconds.toDouble(), 1.0);
    final int clampedMillis = c.position.inMilliseconds.clamp(
      0,
      c.duration.inMilliseconds,
    );
    final double sliderValue = c.isReady ? clampedMillis.toDouble() : 0.0;

    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            overlayShape: SliderComponentShape.noOverlay,
          ),
          child: Slider(
            value: sliderValue.isFinite ? sliderValue : 0,
            max: maxValue,
            onChanged: !c.isReady
                ? null
                : (v) => c.seekTo(Duration(milliseconds: v.round())),
            activeColor: activeColor ?? Theme.of(context).colorScheme.primary,
            inactiveColor: inactiveColor ?? Colors.black.withOpacity(0.2),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_fmt(c.position)),
            Text(c.isReady ? _fmt(c.duration) : '—:—'),
          ],
        ),
      ],
    );
  }
}
