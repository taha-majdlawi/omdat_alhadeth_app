// lib/core/audio/hadeth_audio_controller.dart
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'asset_audio_loader.dart';
import 'audio_service.dart';

class HadethAudioController extends ChangeNotifier {
  final String source; // "assets/sounds/1.ogg" أو URL
  final bool autoPlay;

  late final AudioPlayer _player;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  PlayerState playerState = PlayerState.stopped;

  bool isRepeating = false;
  bool isLoading = true;
  bool isReady = false;
  String? error;

  StreamSubscription? _dSub, _pSub, _sSub, _cSub;

  HadethAudioController({
    required this.source,
    this.autoPlay = false,
  });

  Future<void> init() async {
    _player = await AudioService.createConfiguredPlayer();

    _dSub = _player.onDurationChanged.listen((d) {
      duration = d;
      isReady = d > Duration.zero;
      notifyListeners();
    });

    _pSub = _player.onPositionChanged.listen((p) {
      position = p;
      notifyListeners();
    });

    _sSub = _player.onPlayerStateChanged.listen((s) {
      playerState = s;
      isLoading = false;
      notifyListeners();
    });

    _cSub = _player.onPlayerComplete.listen((_) async {
      if (!isRepeating) {
        await _player.seek(Duration.zero);
        await _player.stop();
      }
      notifyListeners();
    });

    await _loadSource();
  }

  Future<void> _loadSource() async {
    try {
      error = null;
      isLoading = true;
      isReady = false;
      duration = Duration.zero;
      position = Duration.zero;
      notifyListeners();

      final src = source.trim();
      final isAsset = !src.contains('://');

      if (isAsset) {
        final assetPath = src.startsWith('assets/')
            ? src.substring('assets/'.length)
            : src;
        final local = await AssetAudioLoader.copyAssetToTemp(assetPath);
        await _player.setSource(DeviceFileSource(local));
      } else {
        await _player.setSourceUrl(src);
      }

      if (autoPlay) {
        await _player.resume();
      } else {
        await _player.pause();
      }
    } catch (e) {
      error = 'تعذّر تحميل الصوت. تحقق من المسار/الاتصال/الصيغة.\n$e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleRepeat() async {
    isRepeating = !isRepeating;
    await _player.setReleaseMode(
      isRepeating ? ReleaseMode.loop : ReleaseMode.stop,
    );
    notifyListeners();
  }

  Future<void> playPause() async {
    if (error != null) {
      await _loadSource();
      return;
    }
    final isPlaying = playerState == PlayerState.playing;
    final isCompleted = isReady && position >= duration && duration > Duration.zero;
    if (isCompleted) {
      await _player.seek(Duration.zero);
      await _player.resume();
      return;
    }
    if (isPlaying) {
      await _player.pause();
    } else {
      if (!isReady && !isLoading) {
        await _loadSource();
      }
      await _player.resume();
    }
  }

  Future<void> seekTo(Duration d) => _player.seek(d);

  Future<void> seekRelative(Duration delta) async {
    if (!isReady) return;
    final target = position + delta;
    final clamped = target < Duration.zero
        ? Duration.zero
        : (target > duration ? duration : target);
    await _player.seek(clamped);
  }

  Future<void> retry() => _loadSource();

  @override
  void dispose() {
    _dSub?.cancel();
    _pSub?.cancel();
    _sSub?.cancel();
    _cSub?.cancel();
    _player.dispose();
    super.dispose();
  }
}

/// InheritedNotifier بسيطة لتمرير الكنترولر للأبناء بدون باكيجات إضافية.
class HadethAudioScope extends InheritedNotifier<HadethAudioController> {
  const HadethAudioScope({
    super.key,
    required HadethAudioController controller,
    required super.child,
  }) : super(notifier: controller);

  static HadethAudioController of(context) {
    final scope = context.dependOnInheritedWidgetOfExactType<HadethAudioScope>();
    assert(scope != null, 'HadethAudioScope not found in context');
    return scope!.notifier!;
  }
}
