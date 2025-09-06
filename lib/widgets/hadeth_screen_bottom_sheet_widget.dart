import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';

class HadethScreenBottomSheet extends StatefulWidget {
  const HadethScreenBottomSheet({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.soundPathOrUrl, // 'assets/sounds/1.ogg' أو رابط https
    this.autoPlay = false,
    this.title = 'تشغيل الصوت',
  });

  final double screenWidth;
  final double screenHeight;
  final String soundPathOrUrl;
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
  PlayerState _playerState = PlayerState.stopped;

  bool _isRepeating = false;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();

    _player.onDurationChanged.listen((d) {
      if (!mounted) return;
      setState(() => _duration = d);
    });

    _player.onPositionChanged.listen((p) {
      if (!mounted) return;
      setState(() => _position = p);
    });

    _player.onPlayerStateChanged.listen((s) {
      if (!mounted) return;
      setState(() {
        _playerState = s;
        _isLoading = false;
      });
    });

    _player.onPlayerComplete.listen((_) async {
      if (!_isRepeating) {
        await _player.seek(Duration.zero);
        await _player.pause();
        if (mounted) setState(() {});
      }
    });

    _player.setReleaseMode(ReleaseMode.stop); // لا تكرار افتراضيًا
    _init();
  }

  Future<void> _init() async {
    try {
      setState(() {
        _error = null;
        _isLoading = true;
      });

      final src = widget.soundPathOrUrl.trim();
      final isAsset = !src.contains('://');

      if (isAsset) {
        // audioplayers يتوقع المسار داخل مجلد assets بدون "assets/"
        final assetPath =
            src.startsWith('assets/') ? src.substring('assets/'.length) : src;
        await _player.setSource(AssetSource(assetPath));
      } else {
        await _player.setSourceUrl(src);
      }

      if (widget.autoPlay) {
        await _player.resume();
      } else {
        await _player.pause();
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'تعذّر تحميل الصوت. تحقق من المسار أو الاتصال أو الصيغة.';
      });
    } finally {
      if (mounted) setState(() => _isLoading = false);
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
    final maxValue = max<double>(_duration.inMilliseconds.toDouble(), 1.0);
    final value = _position.inMilliseconds
        .clamp(0, _duration.inMilliseconds)
        .toDouble();

    final isPlaying = _playerState == PlayerState.playing;
    final isCompleted = _position >= _duration && _duration > Duration.zero;

    return SafeArea(
      top: false,
      child: Container(
        width: widget.screenWidth,
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
              // مقبض
              Container(
                width: widget.screenWidth * 0.15,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 20),

              // العنوان/الخطأ
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

              // الشريط
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 4,
                  overlayShape: SliderComponentShape.noOverlay,
                ),
                child: Slider(
                  value: value.isFinite ? value : 0,
                  max: maxValue,
                  onChanged: (v) async {
                    if (_duration == Duration.zero) return;
                    await _player.seek(Duration(milliseconds: v.round()));
                  },
                  activeColor: AppColors.darkPrimary,
                  inactiveColor: Colors.black.withOpacity(0.2),
                ),
              ),

              // الوقت
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_fmt(_position)),
                  Text(_duration == Duration.zero ? '—:—' : _fmt(_duration)),
                ],
              ),
              const SizedBox(height: 16),

              // الأزرار
              Row(
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
                    child: _isLoading
                        ? const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            ),
                          )
                        : IconButton(
                            icon: Icon(
                              (isPlaying && !isCompleted)
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                            color: Colors.white,
                            iconSize: 40,
                            onPressed: () async {
                              if (_error != null) {
                                await _init();
                                return;
                              }
                              if (isCompleted) {
                                await _player.seek(Duration.zero);
                                await _player.resume();
                                return;
                              }
                              if (isPlaying) {
                                await _player.pause();
                              } else {
                                if (_duration == Duration.zero && !_isLoading) {
                                  await _init();
                                }
                                await _player.resume();
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
                        _isRepeating ? Icons.repeat_one : Icons.repeat),
                    iconSize: 28,
                    color: _isRepeating ? AppColors.darkPrimary : null,
                    onPressed: () async {
                      _isRepeating = !_isRepeating;
                      await _player.setReleaseMode(
                        _isRepeating ? ReleaseMode.loop : ReleaseMode.stop,
                      );
                      if (mounted) setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
