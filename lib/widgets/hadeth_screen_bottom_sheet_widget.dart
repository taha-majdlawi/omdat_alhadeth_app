import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
// إن لم تكن تملك هذا الثابت، استبدله في الكود بـ Theme.of(context).colorScheme.primary
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
  bool _isReady = false; // أصبح لدينا مدة معروفة
  String? _error;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _configureAudioContext();

    _player.onDurationChanged.listen((d) {
      if (!mounted) return;
      setState(() {
        _duration = d;
        _isReady = d > Duration.zero;
      });
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
        await _player.stop(); // أفضل من pause بعد الاكتمال لملفات Ogg/Opus
        if (mounted) setState(() {});
      }
    });

    _player.setReleaseMode(ReleaseMode.stop);
    _init();
  }

  Future<void> _configureAudioContext() async {
    try {
      await _player.setAudioContext(
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
              // إن أردت: AVAudioSessionOptions.mixWithOthers,
            },
          ),
        ),
      );
    } catch (_) {
      // ليس خطأً قاسيًا
    }
  }

  // يفحص إن كان الأصل مُدرجًا في الحزمة (AssetManifest)
  Future<bool> _assetExists(String assetPathWithPrefix) async {
    try {
      final manifestJson = await rootBundle.loadString('AssetManifest.json');
      return manifestJson.contains('"$assetPathWithPrefix"');
    } catch (_) {
      return false;
    }
  }

  // يتحقق من الإدراج والحجم ثم ينسخ الأصل إلى ملف مؤقت ويعيد مساره
  Future<String> _assertAndCopyAssetToTemp(
    String assetPathWithoutPrefix,
  ) async {
    final full = 'assets/$assetPathWithoutPrefix';

    final listed = await _assetExists(full);
    if (!listed) {
      throw Exception(
        'الأصل غير مُدرج في الحزمة: $full\n'
        'تأكد من pubspec.yaml (assets:) والإملاء الدقيق، ثم flutter clean && flutter run.',
      );
    }

    final data = await rootBundle.load(full);
    if (data.lengthInBytes == 0) {
      throw Exception('الملف فارغ (0 بايت): $full — أعد إنتاجه عبر ffmpeg.');
    }

    final dir = await getTemporaryDirectory();
    final file = File(
      '${dir.path}/$assetPathWithoutPrefix',
    ); // يحافظ على البنية
    await file.create(recursive: true);
    await file.writeAsBytes(data.buffer.asUint8List());
    return file.path;
  }

  Future<void> _init() async {
    try {
      setState(() {
        _error = null;
        _isLoading = true;
        _isReady = false;
        _duration = Duration.zero;
        _position = Duration.zero;
      });

      final src = widget.soundPathOrUrl.trim();
      final isAsset = !src.contains('://');

      if (isAsset) {
        // audioplayers يتوقع داخل الأصول بدون "assets/"
        final assetPath = src.startsWith('assets/')
            ? src.substring('assets/'.length)
            : src;

        // فحص + نسخ إلى ملف مؤقّت (أكثر ثباتًا مع Ogg/Opus)
        final localPath = await _assertAndCopyAssetToTemp(assetPath);
        await _player.setSource(DeviceFileSource(localPath));
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
        _error =
            'تعذّر تحميل الصوت. تحقق من المسار/الاتصال/الصيغة.\nالتفاصيل: $e';
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
    if (!_isReady) return;
    final newPos = _position + Duration(milliseconds: ms);
    final clamped = newPos < Duration.zero
        ? Duration.zero
        : (newPos > _duration ? _duration : newPos);
    await _player.seek(clamped);
  }

  @override
  Widget build(BuildContext context) {
    final primary =
        AppColors.darkPrimary; // أو Theme.of(context).colorScheme.primary

    final double maxValue = max<double>(
      _duration.inMilliseconds.toDouble(),
      1.0,
    );

    final int clampedMillis = _position.inMilliseconds.clamp(
      0,
      _duration.inMilliseconds,
    );

    final double sliderValue = _isReady ? clampedMillis.toDouble() : 0.0;

    final isPlaying = _playerState == PlayerState.playing;
    final isCompleted =
        _isReady && _position >= _duration && _duration > Duration.zero;

    return SafeArea(
      top: false,
      child: Container(
        width: widget.screenWidth,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
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
                  value: sliderValue.isFinite ? sliderValue : 0,
                  max: maxValue,
                  onChanged: !_isReady
                      ? null
                      : (v) async {
                          await _player.seek(Duration(milliseconds: v.round()));
                        },
                  activeColor: primary,
                  inactiveColor: Colors.black.withOpacity(0.2),
                ),
              ),

              // الوقت
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_fmt(_position)),
                  Text(_isReady ? _fmt(_duration) : '—:—'),
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
                    onPressed: (!_isReady || _duration == Duration.zero)
                        ? null
                        : () => _seekRelative(-10000),
                  ),
                  const SizedBox(width: 8),

                  CircleAvatar(
                    radius: 30,
                    backgroundColor: primary,
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
                                if (!_isReady && !_isLoading) {
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
                    onPressed: (!_isReady || _duration == Duration.zero)
                        ? null
                        : () => _seekRelative(10000),
                  ),
                  const SizedBox(width: 8),

                  IconButton(
                    icon: Icon(_isRepeating ? Icons.repeat_one : Icons.repeat),
                    iconSize: 28,
                    color: _isRepeating ? primary : null,
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

              if (_error != null) ...[
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: _init,
                  icon: const Icon(Icons.refresh),
                  label: const Text('إعادة المحاولة'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
