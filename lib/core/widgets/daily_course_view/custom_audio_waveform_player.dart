import 'dart:async';
import 'dart:ui';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';

class CustomAudioWaveformPlayer extends StatefulWidget {
  final double width;
  final double height;
  final double buttonWidth;
  final double buttonHeight;
  final double playPauseIconHeight;
  final Color backgroundColor;
  final bool isAudioContainerBackground;
  final Color playedWaveColor;
  final Color unplayedWaveColor;
  final Color playButtonColor;
  final bool isTimerEnabled;
  final bool isBackgroundContainerEnabled;
  final bool isWaveForm;

  final Duration totalDuration;
  const CustomAudioWaveformPlayer({
    Key? key,
    this.width = 300,
    this.height = 60,
    this.buttonWidth = 55,
    this.buttonHeight = 55,
    this.playPauseIconHeight = 20,
    this.backgroundColor = Colors.grey,
    this.isAudioContainerBackground = true,
    this.playedWaveColor = Colors.white,
    this.unplayedWaveColor = Colors.white54,
    this.playButtonColor = Colors.white,
    this.totalDuration = const Duration(minutes: 3, seconds: 0),
    this.isTimerEnabled = true,
    this.isBackgroundContainerEnabled = true,
    this.isWaveForm= true,
  }) : super(key: key);

  @override
  State<CustomAudioWaveformPlayer> createState() => _CustomAudioWaveformPlayerState();
}

class _CustomAudioWaveformPlayerState extends State<CustomAudioWaveformPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

  Duration currentPosition = Duration.zero;
  double progress = 0.0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;

      if (isPlaying) {
        _animationController.forward();
        _startTimer();
      } else {
        _animationController.reverse();
        _timer?.cancel();
      }
    });
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentPosition >= widget.totalDuration) {
        timer.cancel();
        setState(() {
          isPlaying = false;
          progress = 1.0;
        });
      } else {
        setState(() {
          currentPosition += const Duration(seconds: 1);
          progress = currentPosition.inSeconds / widget.totalDuration.inSeconds;
        });
      }
    });
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.isTimerEnabled)RichText(text: TextSpan(
          children: [
            TextSpan(
              text: "${_formatDuration(currentPosition)} ",
              style: AppStyles.poppins12w700white
            ),
            TextSpan(
              text: "/ ${_formatDuration(widget.totalDuration)}",
              style: AppStyles.poppins12w700darkGrey2
            )
          ]
        )),
        widget.isBackgroundContainerEnabled
            ?ClipRRect(
          borderRadius: BorderRadius.circular(widget.height / 2),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.backgroundColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(widget.height / 2),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: WaveformPainter(
                        progress: progress,
                        playedColor: widget.playedWaveColor,
                        unplayedColor: widget.unplayedWaveColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _togglePlayPause,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(27.5.sp),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: widget.buttonWidth,
                          height: widget.buttonHeight,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 0.5.w),
                          ),
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return SvgPicture.asset(
                                isPlaying ? AppSvgs.pauseSvg : AppSvgs.playSvg,
                                height: 20.h,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
            :ClipRRect(
          borderRadius: BorderRadius.circular(widget.height / 2),
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              //color: widget.backgroundColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(widget.height / 2),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if(widget.isWaveForm)Positioned.fill(
                  child: CustomPaint(
                    painter: WaveformPainter(
                      progress: progress,
                      playedColor: widget.playedWaveColor,
                      unplayedColor: widget.unplayedWaveColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _togglePlayPause,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(27.5.sp),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: widget.buttonWidth,
                        height: widget.buttonHeight,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 0.5.w),
                        ),
                        child: AnimatedBuilder(
                          animation: _animationController,
                          builder: (context, child) {
                            return SvgPicture.asset(
                              isPlaying ? AppSvgs.pauseSvg : AppSvgs.playSvg,
                              height: widget.playPauseIconHeight,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Same waveform painter
class WaveformPainter extends CustomPainter {
  final double progress;
  final Color playedColor;
  final Color unplayedColor;

  WaveformPainter({
    required this.progress,
    required this.playedColor,
    required this.unplayedColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final waveformData = _generateWaveformData(60);
    final centerY = size.height / 2;
    final barWidth = 2.0;
    final spacing = 3.0;
    final totalBars = waveformData.length;
    final totalWidth = totalBars * (barWidth + spacing) - spacing;
    final startX = (size.width - totalWidth) / 2;
    final progressX = size.width * progress;

    for (int i = 0; i < totalBars; i++) {
      final x = startX + i * (barWidth + spacing);
      final barHeight = waveformData[i] * (size.height * 0.6);

      paint.color = x < progressX ? playedColor : unplayedColor;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(x + barWidth / 2, centerY),
            width: barWidth,
            height: barHeight,
          ),
          const Radius.circular(1),
        ),
        paint,
      );
    }
  }

  List<double> _generateWaveformData(int count) {
    final random = math.Random(42);
    return List.generate(count, (index) {
      double baseHeight = 0.3;
      double variation = random.nextDouble() * 0.7;
      if (index % 8 == 0) variation *= 1.5;
      if (index % 12 == 0) variation *= 0.5;
      return math.max(0.1, baseHeight + variation);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
