// lib/ui/sheets/hadeth_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/audio/hadeth_audio_controller.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/widgets/audio_controls.dart';
import 'package:omdat_alhadeth/widgets/audio_progress_bar.dart';

class HadethScreenBottomSheet extends StatefulWidget {
  const HadethScreenBottomSheet({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.soundPathOrUrl, // 'assets/sounds/1.ogg' أو URL
    this.autoPlay = false,
    this.title = 'تشغيل الصوت',
    required this.hadethsInCurrentDoor,
    required this.currentHadethIndex,
    required this.onNavigateToHadeth,
  });

  final double screenWidth;
  final double screenHeight;
  final String soundPathOrUrl;
  final bool autoPlay;
  final String title;
  final List<Hadeth> hadethsInCurrentDoor;
  final int currentHadethIndex;
  final Function(int newIndex) onNavigateToHadeth;

  @override
  State<HadethScreenBottomSheet> createState() =>
      _HadethScreenBottomSheetState();
}

class _HadethScreenBottomSheetState extends State<HadethScreenBottomSheet> {
  late final HadethAudioController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HadethAudioController(
      source: widget.soundPathOrUrl,
      autoPlay: widget.autoPlay,
    );
    _controller.init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primary =
        AppColors.darkPrimary; // أو Theme.of(context).colorScheme.primary

    return SafeArea(
      top: false,
      child: HadethAudioScope(
        controller: _controller,
        child: Container(
          width: widget.screenWidth,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Column(
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
                      _controller.error ?? widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Reem kufi',
                      ),
                    ),
                    const SizedBox(height: 12),

                    // الشريط
                    AudioProgressBar(
                      activeColor: primary,
                      inactiveColor: Colors.black.withOpacity(0.2),
                    ),

                    const SizedBox(height: 16),

                    // الأزرار
                    AudioControls(primary: primary),

                    if (_controller.error != null) ...[
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: _controller.retry,
                        icon: const Icon(Icons.refresh),
                        label: const Text('إعادة المحاولة'),
                      ),
                    ],
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (widget.currentHadethIndex > 0)
                          IconButton(
                            onPressed: () {
                              widget.onNavigateToHadeth(
                                widget.currentHadethIndex - 1,
                              );
                            },
                            icon: const Icon(Icons.arrow_back),
                          //  label: const Text('الحديث السابق'),
                          ),
                        if (widget.currentHadethIndex <
                            widget.hadethsInCurrentDoor.length - 1)
                          IconButton(
                            onPressed: () {
                              widget.onNavigateToHadeth(
                                widget.currentHadethIndex + 1,
                              );
                            },
                            icon: const Icon(Icons.arrow_forward),
                          //  label: const Text('الحديث التالي'),
                          ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
