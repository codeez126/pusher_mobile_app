import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ensure you have the get package imported

const _blue = Color(0xFF60A9FE);

class JourneyHeader extends StatefulWidget {
  final int selectedIndex; // 0-based
  final int totalDays;

  const JourneyHeader({
    super.key,
    required this.selectedIndex,
    this.totalDays = 7,
  });

  @override
  State<JourneyHeader> createState() => _JourneyHeaderState();
}

class _JourneyHeaderState extends State<JourneyHeader> {
  final _stackKey = GlobalKey(); // whole header stack
  final _bubbleKey = GlobalKey(); // blue bubble
  late final List<GlobalKey> _dayKeys; // keys for "01..07"

  double? _bumpLocalX; // bump center X in bubble's local coords
  double? _bubbleLeft; // dynamic left position of the bubble

  @override
  void initState() {
    super.initState();
    _dayKeys = List.generate(widget.totalDays, (_) => GlobalKey());
    WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
  }

  @override
  void didUpdateWidget(covariant JourneyHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex ||
        oldWidget.totalDays != widget.totalDays) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _measure());
    }
  }

  void _measure() {
    final bubbleBox =
        _bubbleKey.currentContext?.findRenderObject() as RenderBox?;
    final stackBox = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    if (bubbleBox == null || stackBox == null) return;

    setState(() {
      _bumpLocalX =
          bubbleBox.size.width / 2; // Center bump exactly at bubble's center
      _bubbleLeft =
          (stackBox.size.width - bubbleBox.size.width) / 2 -
          16; // Center with respect to white container's padding
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        const bubbleHeight = 36.0;
        const bubbleHorizontalPad = 14.0;
        const bubbleVerticalPad = 8.0;
        const bubbleCorner = 18.0;

        final bubbleText =
            "7 Days Journey Day ${widget.selectedIndex + 1}/${widget.totalDays}";
        final bubbleTextPainter = TextPainter(
          text: TextSpan(
            text: bubbleText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();

        final bubbleWidth =
            Get.width * 0.60; // Set width to 60% of screen width

        final effectiveBubbleLeft =
            _bubbleLeft ??
            ((c.maxWidth - 32 - bubbleWidth) /
                2); // Account for 16px padding on each side

        final bumpLocalX =
            _bumpLocalX ?? (bubbleWidth / 2); // Ensure bump is centered

        return Stack(
          key: _stackKey,
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: c.maxWidth,
              height: 51,
              padding: const EdgeInsets.only(bottom: 4, left: 16, right: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.20),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.totalDays,
                itemBuilder: (context, index) {
                  final isPast = index < widget.selectedIndex;
                  final isActive = index == widget.selectedIndex;
                  return Container(
                    key: _dayKeys[index],
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (isPast)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3,
                              vertical: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.20),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                            child: Icon(
                              Icons.check,
                              size: 15,
                              color: const Color(0xff5A5A5A).withOpacity(0.7),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color:
                                isActive
                                    ? Colors.white.withOpacity(0.30)
                                    : Colors.transparent,
                            borderRadius:
                                isActive ? BorderRadius.circular(8) : null,
                            border:
                                isActive
                                    ? Border.all(color: Colors.white, width: 1)
                                    : null,
                            boxShadow:
                                isActive
                                    ? [
                                      BoxShadow(
                                        color: _blue.withOpacity(0.15),
                                        offset: const Offset(0, 4),
                                        blurRadius: 10,
                                      ),
                                    ]
                                    : [],
                          ),
                          child: Text(
                            (index + 1).toString().padLeft(2, '0'),
                            style: TextStyle(
                              color:
                                  isPast
                                      ? const Color(0xff5A5A5A).withOpacity(0.7)
                                      : Colors.white,
                              fontWeight:
                                  isActive ? FontWeight.w600 : FontWeight.w300,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 49, // Align bump with white container
              // left: effectiveBubbleLeft,
              child: RepaintBoundary(
                key: _bubbleKey,
                child: CustomPaint(
                  painter: _BubbleWithBumpPainter(
                    width: bubbleWidth,
                    height: bubbleHeight + 8, // Include scaled-down bump height
                    bumpCenterX: bumpLocalX,
                    bumpWidth: 54,
                    bumpHeight: 8, // Scaled down bump height
                    fill: _blue,
                    strokeColor: Colors.white,
                  ),
                  child: Container(
                    width: bubbleWidth,
                    height: bubbleHeight,
                    padding: const EdgeInsets.symmetric(
                      horizontal: bubbleHorizontalPad,
                      vertical: bubbleVerticalPad,
                    ),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .center, // Vertically center the content
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .center, // Horizontally center the content
                      children: [
                        Transform(
                          transform: Matrix4.translationValues(0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // const Icon(
                              //   Icons.link_rounded,
                              //   size: 16,
                              //   color: Colors.white,
                              // ),
                              Image.asset(
                                'assets/icons/route.png',
                                width: 16,
                                height: 16,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                bubbleText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BubbleWithBumpPainter extends CustomPainter {
  final double width;
  final double height;
  final double bumpCenterX;
  final double bumpWidth;
  final double bumpHeight;
  final Color fill;
  final Color strokeColor;

  _BubbleWithBumpPainter({
    required this.width,
    required this.height,
    required this.bumpCenterX,
    required this.bumpWidth,
    required this.bumpHeight,
    required this.fill,
    required this.strokeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final base =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
              0,
              bumpHeight,
              width,
              height - bumpHeight,
            ), // Adjust base to start below bump
            Radius.circular((height - bumpHeight) / 2),
          ),
        );

    final bw = bumpWidth;
    final bh = bumpHeight;
    final cx = bumpCenterX;
    final leftX = (cx - bw / 2).clamp(6.0, width - 6.0);
    final rightX = (cx + bw / 2).clamp(6.0, width - 6.0);

    final bump =
        Path()
          ..moveTo(leftX, bh) // Start at the top of the bubble
          ..quadraticBezierTo(
            cx - bw * 0.28,
            bh * 0.15, // Shoulder above bubble
            cx,
            0, // Peak at the top edge
          )
          ..quadraticBezierTo(cx + bw * 0.28, bh * 0.15, rightX, bh)
          ..close();

    final union = Path.combine(PathOperation.union, base, bump);

    canvas.drawShadow(union, fill.withOpacity(0.6), 8, false);

    final paintFill =
        Paint()
          ..shader = LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [fill.withOpacity(0.95), fill],
          ).createShader(Rect.fromLTWH(0, 0, width, height));
    canvas.drawPath(union, paintFill);

    final paintStroke =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = strokeColor;
    canvas.drawPath(union, paintStroke);
  }

  @override
  bool shouldRepaint(covariant _BubbleWithBumpPainter oldDelegate) {
    return width != oldDelegate.width ||
        height != oldDelegate.height ||
        bumpCenterX != oldDelegate.bumpCenterX ||
        bumpWidth != oldDelegate.bumpWidth ||
        bumpHeight != oldDelegate.bumpHeight ||
        fill != oldDelegate.fill ||
        strokeColor != oldDelegate.strokeColor;
  }
}
