import 'dart:io';
import 'package:base_project/core/constants/app_fonts_and_styles.dart';
import 'package:base_project/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../Constants/app_colors.dart';
import '../utils/image_compressor.dart';
import 'custom_bottom_sheet.dart';

class ImagePickerWidget extends StatefulWidget {
  final Widget? child;
  final Function(File?)? onImageSelected;
  final double? maxWidth;
  final double? maxHeight;
  final int? quality;
  final bool enableCrop;
  final CropAspectRatio? aspectRatio;
  final String? title;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final bool showPreview;
  final double? previewSize;
  final BorderRadius? borderRadius;
  final bool preferJpeg; // New parameter to prefer JPEG over PNG

  const ImagePickerWidget({
    super.key,
    this.child,
    this.onImageSelected,
    this.maxWidth = 800,
    this.maxHeight = 600,
    this.quality = 80,
    this.enableCrop = true,
    this.aspectRatio,
    this.title,
    this.backgroundColor,
    this.padding,
    this.showPreview = true,
    this.previewSize = 100,
    this.borderRadius,
    this.preferJpeg = true, // Default to JPEG for better compression
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _selectedImage;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showImagePickerOptions,
      child: widget.child ?? _buildDefaultWidget(),
    );
  }

  Widget _buildDefaultWidget() {
    return Container(
      width: widget.previewSize,
      height: widget.previewSize,
      padding: widget.padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[200],
        borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child:
          widget.showPreview && _selectedImage != null
              ? ClipRRect(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                child: Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.error,
                        color: Colors.grey[600],
                        size: 40,
                      ),
                    );
                  },
                ),
              )
              : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate,
                    size: 40,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add Photo'.tr,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
    );
  }
  void showImagePickerOptions() {
    CustomBottomSheet.show(
      backgroundColor: AppColors.darkGrey2.withOpacity(0.60),
      context: context,
      title: widget.title ?? 'Select Image'.tr,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.darkGrey2,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Choose an option".tr, style: AppStyles.poppins16w700white),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPickerOption(
                  context,
                  "Camera".tr,
                  Icons.camera_alt,
                  () async {
                    pickImage(ImageSource.camera);
                  },
                ),
                _buildPickerOption(
                  context,
                  "Gallery".tr,
                  Icons.photo_library,
                  () async {
                    pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerOption(
    BuildContext context,
    String title,
    IconData icon,
    Function() onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.whiteColor.withOpacity(0.5),
            child: Icon(icon, color: AppColors.whiteColor, size: 30),
          ),
          const SizedBox(height: 8),
          Text(title,style: AppStyles.poppins14w700white,),
        ],
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      setState(() {
        _isProcessing = true;
      });

      Navigator.pop(context); // Close bottom sheet

      final ImagePicker picker = ImagePicker();

      // Enhanced image picking with better error handling
      final XFile? pickedFile = await picker.pickImage(
        source: source,
        maxWidth: widget.maxWidth,
        maxHeight: widget.maxHeight,
        imageQuality: widget.quality,
        // Prefer JPEG for better compression and compatibility
        preferredCameraDevice: CameraDevice.rear,
      );

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);

        // Validate file exists and is readable
        if (!await imageFile.exists()) {
          throw Exception('Image file not found');
        }

        // Check file size (optional - prevent huge files)
        final fileSize = await imageFile.length();
        if (fileSize > 50 * 1024 * 1024) {
          // 50MB limit
          throw Exception('Image file too large (max 50MB)');
        }

        // Crop image if enabled
        if (widget.enableCrop) {
          final croppedFile = await _cropImage(imageFile);
          if (croppedFile != null) {
            imageFile = croppedFile;
          } else {
            // User cancelled cropping
            setState(() {
              _isProcessing = false;
            });
            return;
          }
        }

        // Compress image with better error handling
        File? compressedFile;
        try {
          compressedFile = await ImageCompressor.compressImage(
            imageFile,
            maxWidth: widget.maxWidth?.toInt() ?? 800,
            maxHeight: widget.maxHeight?.toInt() ?? 600,
            quality: widget.quality ?? 80,
          );
        } catch (compressionError) {
          // If compression fails, use original file
          debugPrint('Image compression failed: $compressionError');
          compressedFile = imageFile;
        }

        setState(() {
          _selectedImage = compressedFile;
          _isProcessing = false;
        });

        // Callback with selected image
        widget.onImageSelected?.call(compressedFile);
      } else {
        setState(() {
          _isProcessing = false;
        });
      }
    } catch (e) {
      setState(() {
        _isProcessing = false;
      });

      debugPrint('Error picking image: $e');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error selecting image: ${_getErrorMessage(e)}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatio: widget.aspectRatio,
        compressFormat:
            widget.preferJpeg
                ? ImageCompressFormat.jpg
                : ImageCompressFormat.png,
        compressQuality: widget.quality ?? 80,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: AppColors.darkGrey2,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: widget.aspectRatio != null,
            hideBottomControls: false,
            showCropGrid: true,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: widget.aspectRatio != null,
            resetAspectRatioEnabled: widget.aspectRatio == null,
            rotateButtonsHidden: false,
            rotateClockwiseButtonHidden: false,
          ),
        ],
      );

      if (croppedFile != null) {
        return File(croppedFile.path);
      }
      return null;
    } catch (e) {
      debugPrint('Error cropping image: $e');
      // Return original file if cropping fails
      return imageFile;
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error.toString().contains('permission')) {
      return 'Permission denied. Please check camera/storage permissions.';
    } else if (error.toString().contains('network')) {
      return 'Network error. Please check your connection.';
    } else if (error.toString().contains('too large')) {
      return 'Image file is too large. Please select a smaller image.';
    }
    return 'Unable to process image. Please try again.';
  }

  void _removeImage() {
    Navigator.pop(context); // Close bottom sheet
    setState(() {
      _selectedImage = null;
    });
    widget.onImageSelected?.call(null);
  }
}
