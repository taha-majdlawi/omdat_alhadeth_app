import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';

// If you defined your own colors, replace with your class or use Theme.of(context)

class HadethScreenBottomSheet extends StatefulWidget {
  const HadethScreenBottomSheet({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.soundPathOrUrl, // Accepts assets or URL
    this.autoPlay = false,
    this.title = 'تشغيل الصوت',
  });

  final double screenWidth;
  final double screenHeight;
  final String
  soundPathOrUrl; // e.g. 'assets/sounds/1.opus' OR 'https://.../file.mp3'
  final bool autoPlay;
  final String title;

  @override
  State<HadethScreenBottomSheet> createState() =>
      _HadethScreenBottomSheetState();
}

class _HadethScreenBottomSheetState extends State<HadethScreenBottomSheet> {
  late final AudioPlayer _player;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  bool _isRepeating = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    // Listen for updates
    _player.durationStream.listen((d) {
      if (d != null && mounted) setState(() => _duration = d);
    });
    _player.positionStream.listen((p) {
      if (mounted) setState(() => _position = p);
    });
    _player.playbackEventStream.listen(
      (_) {},
      onError: (e, s) {
        if (mounted) {
          setState(() {
            _error = 'تعذّر تشغيل الملف الصوتي. تحقق من الصيغة أو المسار.';
          });
        }
      },
    );

    _init();
  }

  Future<void> _init() async {
    try {
      _error = null;
      setState(() {});

      final src = widget.soundPathOrUrl.trim();
      final bool isAsset = !src.contains('://'); // no scheme → treat as asset

      if (isAsset) {
        // ASSET
        log('asset1');
        await _player.setAudioSource(AudioSource.asset(src));
        log('asset2');
      } else {
        // URL
        await _player.setAudioSource(AudioSource.uri(Uri.parse(src)));
        log('NOT asset');
      }

      if (widget.autoPlay) {
        await _player.play();
      }
    } catch (_) {
      setState(() {
        _error =
            'تعذّر تحميل الصوت. إن كان من الأصول فتأكّد من pubspec.yaml والمسار (استخدم / وليس \\). وإن كان رابطًا فتأكّد من الاتصال.';
      });
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _fmt(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return h > 0 ? '$h:$m:$s' : '${int.parse(m)}:$s';
  }

  Future<void> _seekRelative(int ms) async {
    final newPos = _position + Duration(milliseconds: ms);
    await _player.seek(newPos < Duration.zero ? Duration.zero : newPos);
  }

  @override
  Widget build(BuildContext context) {
    final max = _duration.inMilliseconds > 0
        ? _duration.inMilliseconds.toDouble()
        : 1.0;
    final value = _position.inMilliseconds
        .clamp(0, _duration.inMilliseconds)
        .toDouble();

    return SafeArea(
      top: false,
      child: Container(
        width: widget.screenWidth,
        // Let height grow with content; the sheet itself will control overall size
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: widget.screenWidth * 0.15,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),

              // Title / Error
              Text(
                _error ?? widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Reem kufi',
                ),
              ),
              const SizedBox(height: 12),

              // Slider
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 4,
                  overlayShape: SliderComponentShape.noOverlay,
                ),
                child: Slider(
                  value: value.isFinite ? value : 0,
                  max: max,
                  onChanged: (v) async {
                    if (_duration == Duration.zero) return;
                    await _player.seek(Duration(milliseconds: v.round()));
                  },
                  activeColor: AppColors.darkPrimary,
                  inactiveColor: Colors.black.withOpacity(0.2),
                ),
              ),

              // Time labels
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_fmt(_position)),
                  Text(_duration == Duration.zero ? '—:—' : _fmt(_duration)),
                ],
              ),
              const SizedBox(height: 16),

              // Controls
              StreamBuilder<PlayerState>(
                stream: _player.playerStateStream,
                builder: (context, snap) {
                  final state = snap.data;
                  final playing = state?.playing ?? false;
                  final processing = state?.processingState;
                  final isLoading =
                      processing == ProcessingState.loading ||
                      processing == ProcessingState.buffering;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.replay_10),
                        iconSize: 34,
                        onPressed: _duration == Duration.zero
                            ? null
                            : () => _seekRelative(-10000),
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: AppColors.darkPrimary,
                        child: isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.white,
                                ),
                              )
                            : IconButton(
                                icon: Icon(
                                  playing ? Icons.pause : Icons.play_arrow,
                                ),
                                color: Colors.white,
                                iconSize: 40,
                                onPressed: () async {
                                  if (_error != null) {
                                    await _init();
                                    return;
                                  }
                                  if (playing) {
                                    await _player.pause();
                                  } else {
                                    await _player.play();
                                  }
                                },
                              ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: const Icon(Icons.forward_10),
                        iconSize: 34,
                        onPressed: _duration == Duration.zero
                            ? null
                            : () => _seekRelative(10000),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: Icon(
                          _isRepeating ? Icons.repeat_one : Icons.repeat,
                        ),
                        iconSize: 28,
                        color: _isRepeating ? AppColors.darkPrimary : null,
                        onPressed: () async {
                          _isRepeating = !_isRepeating;
                          await _player.setLoopMode(
                            _isRepeating ? LoopMode.one : LoopMode.off,
                          );
                          setState(() {});
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
