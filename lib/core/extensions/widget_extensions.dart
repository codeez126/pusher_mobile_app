import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  // Padding
  Widget paddingAll(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);

  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );

  // Margin
  Widget marginAll(double margin) =>
      Container(margin: EdgeInsets.all(margin), child: this);

  Widget marginSymmetric({double horizontal = 0, double vertical = 0}) =>
      Container(
        margin: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  Widget marginOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Container(
    margin: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    child: this,
  );

  // Layout
  Widget center() => Center(child: this);

  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);

  // Decoration
  Widget withBackground(Color color) => Container(color: color, child: this);

  Widget withBorder({
    Color color = Colors.grey,
    double width = 1.0,
    double radius = 0.0,
  }) => Container(
    decoration: BoxDecoration(
      border: Border.all(color: color, width: width),
      borderRadius: BorderRadius.circular(radius),
    ),
    child: this,
  );

  Widget withShadow({
    Color color = Colors.black26,
    double blurRadius = 4.0,
    Offset offset = const Offset(0, 2),
  }) => Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(color: color, blurRadius: blurRadius, offset: offset),
      ],
    ),
    child: this,
  );

  // Gestures
  Widget onTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);

  Widget onDoubleTap(VoidCallback onDoubleTap) =>
      GestureDetector(onDoubleTap: onDoubleTap, child: this);

  Widget onLongPress(VoidCallback onLongPress) =>
      GestureDetector(onLongPress: onLongPress, child: this);

  // Visibility
  Widget visible(bool visible) => Visibility(visible: visible, child: this);

  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);
}
