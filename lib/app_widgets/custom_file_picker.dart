import 'dart:io';
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class CustomFilePicker {
  /// Pick PDF file from device
  Future<Map<String, dynamic>?> pickPDFFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: false,
        allowCompression: false,
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;

        // Check if path is available
        if (file.path == null || file.path!.isEmpty) {
          _showErrorSnackbar('Unable to access file path');
          return null;
        }

        // Check file size (optional: limit to 10MB)
        if (file.size > 10 * 1024 * 1024) {
          _showErrorSnackbar('File size should not exceed 10MB');
          return null;
        }

        return {
          'file': File(file.path!),
          'name': file.name,
          'size': file.size,
        };
      }
      return null;
    } on Exception catch (e) {
      print('File picker error: $e');
      _showErrorSnackbar('Failed to pick file. Please try again.');
      return null;
    } catch (e) {
      print('Unexpected error: $e');
      _showErrorSnackbar('An unexpected error occurred');
      return null;
    }
  }

  /// Pick multiple PDF files from device
  Future<List<Map<String, dynamic>>> pickMultiplePDFFiles({int maxFiles = 5}) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        List<Map<String, dynamic>> files = [];

        for (var file in result.files.take(maxFiles)) {
          // Check file size
          if (file.size > 10 * 1024 * 1024) {
            _showErrorSnackbar('${file.name} exceeds 10MB limit');
            continue;
          }

          files.add({
            'file': File(file.path!),
            'name': file.name,
            'size': file.size,
          });
        }

        return files;
      }
      return [];
    } catch (e) {
      _showErrorSnackbar('Failed to pick files: $e');
      return [];
    }
  }

  /// Pick any document file (PDF, DOC, DOCX, etc.)
  Future<Map<String, dynamic>?> pickDocumentFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;

        // Check file size (optional: limit to 10MB)
        if (file.size > 10 * 1024 * 1024) {
          _showErrorSnackbar('File size should not exceed 10MB');
          return null;
        }

        return {
          'file': File(file.path!),
          'name': file.name,
          'size': file.size,
          'extension': file.extension,
        };
      }
      return null;
    } catch (e) {
      _showErrorSnackbar('Failed to pick file: $e');
      return null;
    }
  }

  /// Format file size to readable format
  String formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    } else if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    } else {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
  }

  /// Show error message
  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppTheme.redColor,
      colorText: AppTheme.whiteColor,
      duration: const Duration(seconds: 2),
    );
  }
}