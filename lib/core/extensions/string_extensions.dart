// core/extensions/string_extensions.dart
extension StringExtensions on String {
  bool get isValidEmail =>
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  bool get isValidPhone => RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(this);

  String get capitalize =>
      isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  String get toTitleCase => split(' ').map((word) => word.capitalize).join(' ');

  bool get isNullOrEmpty => isEmpty;
}
