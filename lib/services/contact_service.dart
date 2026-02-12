// lib/services/contact_service.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactService {
  /// Launches email or WhatsApp based on the contact value
  ///
  /// [contactValue] - Email address or phone number
  /// [context] - BuildContext for showing snackbars (optional)
  ///
  /// Returns true if launched successfully, false otherwise
  static Future<bool> launchContact({
    required String? contactValue,
    BuildContext? context,
  }) async {
    if (contactValue == null || contactValue.isEmpty) {
      _showError(context, 'No contact information available');
      return false;
    }

    // Check if it's an email (contains @)
    if (contactValue.contains('@')) {
      return await _launchEmail(
        email: contactValue,
        context: context,
      );
    } else {
      return await _launchWhatsApp(
        phoneNumber: contactValue,
        context: context,
      );
    }
  }

  /// Launches email app with the provided email address
  ///
  /// [email] - Email address
  /// [subject] - Optional email subject
  /// [body] - Optional email body
  /// [context] - BuildContext for showing snackbars (optional)
  static Future<bool> _launchEmail({
    required String email,
    String? subject,
    String? body,
    BuildContext? context,
  }) async {
    try {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: email,
        queryParameters: {
          if (subject != null) 'subject': subject,
          if (body != null) 'body': body,
        },
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
        return true;
      } else {
        _showError(context, 'Could not open email app');
        return false;
      }
    } catch (e) {
      _showError(context, 'Error opening email: $e');
      return false;
    }
  }

  /// Launches WhatsApp with the provided phone number
  ///
  /// [phoneNumber] - Phone number (with or without country code)
  /// [message] - Optional pre-filled message
  /// [context] - BuildContext for showing snackbars (optional)
  static Future<bool> _launchWhatsApp({
    required String phoneNumber,
    String? message,
    BuildContext? context,
  }) async {
    try {
      // Remove any non-numeric characters except +
      String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

      // Build WhatsApp URL
      String url = 'https://wa.me/$cleanedNumber';
      if (message != null && message.isNotEmpty) {
        url += '?text=${Uri.encodeComponent(message)}';
      }

      final Uri whatsappUri = Uri.parse(url);

      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
        return true;
      } else {
        _showError(context, 'Could not open WhatsApp');
        return false;
      }
    } catch (e) {
      _showError(context, 'Error opening WhatsApp: $e');
      return false;
    }
  }

  /// Launches phone dialer with the provided phone number
  ///
  /// [phoneNumber] - Phone number to call
  /// [context] - BuildContext for showing snackbars (optional)
  static Future<bool> launchPhone({
    required String phoneNumber,
    BuildContext? context,
  }) async {
    try {
      // Remove any non-numeric characters except +
      String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

      final Uri phoneUri = Uri(
        scheme: 'tel',
        path: cleanedNumber,
      );

      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
        return true;
      } else {
        _showError(context, 'Could not open phone dialer');
        return false;
      }
    } catch (e) {
      _showError(context, 'Error opening phone: $e');
      return false;
    }
  }

  /// Launches SMS app with the provided phone number
  ///
  /// [phoneNumber] - Phone number for SMS
  /// [message] - Optional pre-filled message
  /// [context] - BuildContext for showing snackbars (optional)
  static Future<bool> launchSMS({
    required String phoneNumber,
    String? message,
    BuildContext? context,
  }) async {
    try {
      // Remove any non-numeric characters except +
      String cleanedNumber = phoneNumber.replaceAll(RegExp(r'[^\d+]'), '');

      final Uri smsUri = Uri(
        scheme: 'sms',
        path: cleanedNumber,
        queryParameters: message != null ? {'body': message} : null,
      );

      if (await canLaunchUrl(smsUri)) {
        await launchUrl(smsUri);
        return true;
      } else {
        _showError(context, 'Could not open SMS app');
        return false;
      }
    } catch (e) {
      _showError(context, 'Error opening SMS: $e');
      return false;
    }
  }

  /// Launches a URL in the browser
  ///
  /// [url] - URL to open
  /// [inApp] - Whether to open in in-app browser (default: false)
  /// [context] - BuildContext for showing snackbars (optional)
  static Future<bool> launchURL({
    required String url,
    bool inApp = false,
    BuildContext? context,
  }) async {
    try {
      final Uri uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: inApp ? LaunchMode.inAppWebView : LaunchMode.externalApplication,
        );
        return true;
      } else {
        _showError(context, 'Could not open URL');
        return false;
      }
    } catch (e) {
      _showError(context, 'Error opening URL: $e');
      return false;
    }
  }

  /// Shows error message using SnackBar if context is provided
  static void _showError(BuildContext? context, String message) {
    if (context != null && context.mounted) {
      print(message);
    }
  }
}


//// Simple usage - auto-detects email or WhatsApp
// onContact: () async {
//   await ContactService.launchContact(
//     contactValue: eventVendor.preferredContactValue,
//     context: context,
//   );
// },
//
// // Or use specific methods:
//
// // Email with subject and body
// await ContactService._launchEmail(
//   email: 'vendor@example.com',
//   subject: 'Event Inquiry',
//   body: 'Hello, I would like to know...',
//   context: context,
// );
//
// // WhatsApp with pre-filled message
// await ContactService._launchWhatsApp(
//   phoneNumber: '+1234567890',
//   message: 'Hi! I found you on Eventori',
//   context: context,
// );
//
// // Phone call
// await ContactService.launchPhone(
//   phoneNumber: '+1234567890',
//   context: context,
// );
//
// // SMS
// await ContactService.launchSMS(
//   phoneNumber: '+1234567890',
//   message: 'Hello!',
//   context: context,
// );
//
// // Open website
// await ContactService.launchURL(
//   url: 'https://example.com',
//   inApp: false,
//   context: context,
// );