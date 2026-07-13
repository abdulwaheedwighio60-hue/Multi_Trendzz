import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  ImagePickerService._();

  static final ImagePickerService instance = ImagePickerService._();

  static const Color primaryColor = Color(0xFFFF4747);

  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage(BuildContext context) async {
    final ImageSource? source = await _showImagePickerDialog(context);

    if (source == null) return null;

    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 90,
    );

    if (image == null) return null;

    return File(image.path);
  }

  Future<ImageSource?> _showImagePickerDialog(
      BuildContext context,
      ) async {
    return showDialog<ImageSource>(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                /// Header Icon
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.photo_camera_back_rounded,
                    color: primaryColor,
                    size: 34,
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  "Select Profile Photo",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "Choose how you want to add your profile picture.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 28),

                _buildOption(
                  icon: Icons.camera_alt_rounded,
                  title: "Camera",
                  subtitle: "Capture a new photo",
                  onTap: () {
                    Navigator.pop(context, ImageSource.camera);
                  },
                ),

                const SizedBox(height: 14),

                _buildOption(
                  icon: Icons.photo_library_rounded,
                  title: "Gallery",
                  subtitle: "Choose from your photos",
                  onTap: () {
                    Navigator.pop(context, ImageSource.gallery);
                  },
                ),

                const SizedBox(height: 22),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text("Cancel"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Row(
          children: [

            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.camera_alt_rounded,
                color: primaryColor,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ],
        ),
      ),
    );
  }
}