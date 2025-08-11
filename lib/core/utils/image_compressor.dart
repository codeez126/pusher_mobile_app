import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImageCompressor {
  static Future<File> compressImage(
    File imageFile, {
    required int maxWidth,
    required int maxHeight,
    required int quality,
    bool preferJpeg = true,
  }) async {
    try {
      // Read image bytes
      final Uint8List imageBytes = await imageFile.readAsBytes();

      // Decode image
      img.Image? image = img.decodeImage(imageBytes);
      if (image == null) {
        throw Exception('Unable to decode image');
      }

      // Calculate new dimensions while maintaining aspect ratio
      int newWidth = image.width;
      int newHeight = image.height;

      if (newWidth > maxWidth || newHeight > maxHeight) {
        double widthRatio = maxWidth / newWidth;
        double heightRatio = maxHeight / newHeight;
        double ratio = widthRatio < heightRatio ? widthRatio : heightRatio;

        newWidth = (newWidth * ratio).round();
        newHeight = (newHeight * ratio).round();
      }

      // Resize image if needed
      if (newWidth != image.width || newHeight != image.height) {
        image = img.copyResize(
          image,
          width: newWidth,
          height: newHeight,
          interpolation: img.Interpolation.linear,
        );
      }

      // Get temporary directory
      final Directory tempDir = await getTemporaryDirectory();
      final String fileName = path.basenameWithoutExtension(imageFile.path);
      final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();

      // Determine output format
      String extension;
      List<int> compressedBytes;

      if (preferJpeg ||
          imageFile.path.toLowerCase().endsWith('.jpg') ||
          imageFile.path.toLowerCase().endsWith('.jpeg')) {
        extension = 'jpg';
        compressedBytes = img.encodeJpg(image, quality: quality);
      } else {
        extension = 'png';
        // PNG compression quality is different - use level instead
        compressedBytes = img.encodePng(
          image,
          level: _getPngCompressionLevel(quality),
        );
      }

      // Create output file
      final String outputPath = path.join(
        tempDir.path,
        '${fileName}_compressed_$timestamp.$extension',
      );

      final File compressedFile = File(outputPath);
      await compressedFile.writeAsBytes(compressedBytes);

      return compressedFile;
    } catch (e) {
      debugPrint('Error compressing image: $e');
      // Return original file if compression fails
      return imageFile;
    }
  }

  /// Convert JPEG quality (0-100) to PNG compression level (0-9)
  static int _getPngCompressionLevel(int jpegQuality) {
    // Invert because PNG level 0 = no compression, 9 = max compression
    // JPEG quality 100 = best quality, 0 = worst quality
    return ((100 - jpegQuality) / 100 * 9).round().clamp(0, 9);
  }

  /// Get file size in bytes
  static Future<int> getFileSize(File file) async {
    try {
      return await file.length();
    } catch (e) {
      return 0;
    }
  }

  /// Format file size for display
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  /// Validate image file
  static Future<bool> isValidImage(File file) async {
    try {
      final bytes = await file.readAsBytes();
      final image = img.decodeImage(bytes);
      return image != null;
    } catch (e) {
      return false;
    }
  }
}
