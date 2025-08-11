import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/image_picker_widget.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({super.key});

  @override
  State<ImagePickerExample> createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File? _profileImage;
  File? _coverImage;
  File? _galleryImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Examples'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Picture',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Center(
              child: ImagePickerWidget(
                onImageSelected: (file) {
                  setState(() {
                    _profileImage = file;
                  });
                },
                aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
                previewSize: 120,
                borderRadius: BorderRadius.circular(60),
                title: 'Select Profile Picture',
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child:
                      _profileImage != null
                          ? ClipOval(
                            child: Image.file(
                              _profileImage!,
                              fit: BoxFit.cover,
                            ),
                          )
                          : Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.grey[600],
                          ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            const Text(
              'Cover Photo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ImagePickerWidget(
              onImageSelected: (file) {
                setState(() {
                  _coverImage = file;
                });
              },
              aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
              title: 'Select Cover Photo',
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child:
                    _coverImage != null
                        ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(_coverImage!, fit: BoxFit.cover),
                        )
                        : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.landscape,
                              size: 60,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Add Cover Photo',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
              ),
            ),
            const SizedBox(height: 32),

            const Text(
              'Gallery Image',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ImagePickerWidget(
                  onImageSelected: (file) {
                    setState(() {
                      _galleryImage = file;
                    });
                  },
                  enableCrop: false,
                  previewSize: 100,
                  title: 'Select Gallery Image',
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Default image picker'),
                      const SizedBox(height: 4),
                      const Text(
                        'No cropping enabled',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      CustomRoundButton(
                        text: 'Custom Picker',
                        backgroundColor: Colors.purple,
                        onPressed: () {
                          // Custom implementation
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            if (_profileImage != null ||
                _coverImage != null ||
                _galleryImage != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selected Images Info',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (_profileImage != null)
                        Text('Profile: ${_profileImage!.path.split('/').last}'),
                      if (_coverImage != null)
                        Text('Cover: ${_coverImage!.path.split('/').last}'),
                      if (_galleryImage != null)
                        Text('Gallery: ${_galleryImage!.path.split('/').last}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
