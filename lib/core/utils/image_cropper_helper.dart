import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageCropperHelper {
  /// Crop image with default settings
  static Future<File?> cropImage(
    String imagePath, {
    CropAspectRatio? aspectRatio,
    String toolbarTitle = 'Crop Image',
    Color? toolbarColor,
    Color? toolbarWidgetColor,
    bool lockAspectRatio = false,
  }) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imagePath,
        aspectRatio: aspectRatio,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: toolbarTitle,
            toolbarColor: toolbarColor ?? Colors.blue,
            toolbarWidgetColor: toolbarWidgetColor ?? Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: lockAspectRatio,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ],
          ),
          IOSUiSettings(
            title: toolbarTitle,
            aspectRatioLockEnabled: lockAspectRatio,
            resetAspectRatioEnabled: !lockAspectRatio,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ],
          ),
        ],
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Crop image to square
  static Future<File?> cropToSquare(String imagePath) async {
    return cropImage(
      imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      lockAspectRatio: true,
      toolbarTitle: 'Crop to Square',
    );
  }

  /// Crop image to circle (actually square, but for profile pics)
  static Future<File?> cropToCircle(String imagePath) async {
    return cropImage(
      imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      lockAspectRatio: true,
      toolbarTitle: 'Crop Profile Picture',
    );
  }

  /// Crop image to 16:9 aspect ratio
  static Future<File?> cropToWidescreen(String imagePath) async {
    return cropImage(
      imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
      lockAspectRatio: true,
      toolbarTitle: 'Crop to Widescreen',
    );
  }

  /// Crop image to 4:3 aspect ratio
  static Future<File?> cropToStandard(String imagePath) async {
    return cropImage(
      imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 4, ratioY: 3),
      lockAspectRatio: true,
      toolbarTitle: 'Crop to Standard',
    );
  }
}
