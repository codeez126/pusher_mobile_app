import 'dart:ui';

import 'package:base_project/core/Constants/app_colors.dart';
import 'package:base_project/core/constants/app_svgs.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAudioWaveformPlayer extends StatefulWidget {
  final double width;
  final double buttonWidth;
  final double height;
  final double buttonHeight;
  final Color backgroundColor;
  final bool isAudioContainerBackground;
  final Color playedWaveColor;
  final Color unplayedWaveColor;
  final Color playButtonColor;
  final double progress; // 0.0 to 1.0

  const CustomAudioWaveformPlayer({
    Key? key,
    this.width = 300,
    this.height = 60,
    this.buttonWidth = 45,
    this.buttonHeight = 45,
    this.backgroundColor = Colors.grey,
    this.isAudioContainerBackground = true,
    this.playedWaveColor = Colors.white,
    this.unplayedWaveColor = Colors.white54,
    this.playButtonColor = Colors.white,
    this.progress = 0.3,
  }) : super(key: key);

  @override
  State<CustomAudioWaveformPlayer> createState() => _CustomAudioWaveformPlayerState();
}

class _CustomAudioWaveformPlayerState extends State<CustomAudioWaveformPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isPlaying = false;

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
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
      if (isPlaying) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.isAudioContainerBackground?ClipRRect(
      borderRadius: BorderRadius.circular(widget.height / 2),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.height / 2),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Waveform
              Positioned.fill(
                child: CustomPaint(
                  painter: WaveformPainter(
                    progress: widget.progress,
                    playedColor: widget.playedWaveColor,
                    unplayedColor: widget.unplayedWaveColor,
                  ),
                ),
              ),

              // Play/Pause Button
              GestureDetector(
                onTap: _togglePlayPause,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.sp),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        //color: widget.playButtonColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.whiteColor,width: 0.5.w)
                      ),
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Icon(
                            isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.black87,
                            size: 24,
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
    ):ClipRRect(
      borderRadius: BorderRadius.circular(widget.height / 2),
      child: Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: WaveformPainter(
                  progress: widget.progress,
                  playedColor: widget.playedWaveColor,
                  unplayedColor: widget.unplayedWaveColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: _togglePlayPause,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.sp),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: widget.buttonWidth,
                    height: widget.buttonHeight,
                    decoration: BoxDecoration(
                        //color: widget.playButtonColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.whiteColor,width: 0.5.w)
                    ),
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Center(
                          child: SvgPicture.asset(
                            isPlaying?AppSvgs.pauseSvg:AppSvgs.playSvg,
                            height: isPlaying?20.h:15.h,
                          ),
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
    );
  }
}

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

    // Generate waveform data (simulated)
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

      // Determine color based on progress
      paint.color = x < progressX ? playedColor : unplayedColor;

      // Draw the waveform bar
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
    final random = math.Random(42); // Seed for consistent pattern
    return List.generate(count, (index) {
      // Create a more realistic waveform pattern
      double baseHeight = 0.3;
      double variation = random.nextDouble() * 0.7;

      // Add some peaks and valleys
      if (index % 8 == 0) variation *= 1.5;
      if (index % 12 == 0) variation *= 0.5;

      return math.max(0.1, baseHeight + variation);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}

// Usage Example
class AudioPlayerDemo extends StatefulWidget {
  @override
  State<AudioPlayerDemo> createState() => _AudioPlayerDemoState();
}

class _AudioPlayerDemoState extends State<AudioPlayerDemo> {
  double progress = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAudioWaveformPlayer(
              width: 320,
              height: 60,
              backgroundColor: Colors.grey[600]!,
              playedWaveColor: Colors.white,
              unplayedWaveColor: Colors.white60,
              playButtonColor: Colors.white,
              progress: progress,
            ),
            const SizedBox(height: 40),

            // Progress slider for demo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Slider(
                value: progress,
                onChanged: (value) {
                  setState(() {
                    progress = value;
                  });
                },
                activeColor: Colors.white,
                inactiveColor: Colors.white30,
              ),
            ),

            Text(
              'Progress: ${(progress * 100).toInt()}%',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}