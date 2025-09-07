// lib/core/audio/asset_audio_loader.dart
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class AssetAudioLoader {
  static Future<bool> _assetExists(String fullAssetPath) async {
    try {
      final manifest = await rootBundle.loadString('AssetManifest.json');
      return manifest.contains('"$fullAssetPath"');
    } catch (_) {
      return false;
    }
  }

  /// [assetPathWithoutPrefix] مثال: "sounds/165.ogg"
  static Future<String> copyAssetToTemp(String assetPathWithoutPrefix) async {
    final full = 'assets/$assetPathWithoutPrefix';

    final listed = await _assetExists(full);
    if (!listed) {
      throw Exception(
        'الأصل غير مُدرج: $full\nتحقق من pubspec.yaml ثم flutter clean && flutter run.',
      );
    }

    final data = await rootBundle.load(full);
    if (data.lengthInBytes == 0) {
      throw Exception('الملف فارغ (0 بايت): $full — أعد إنتاجه عبر ffmpeg.');
    }

    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$assetPathWithoutPrefix');
    await file.create(recursive: true);
    await file.writeAsBytes(data.buffer.asUint8List());
    return file.path;
  }
}
