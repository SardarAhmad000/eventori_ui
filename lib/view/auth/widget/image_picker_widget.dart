// // lib/widgets/profile_image_picker.dart
// import 'dart:io';
// import 'package:flutter/material.dart';
//
// import '../../../../AppTheme/widgets/app_theme.dart';
// import '../../../../constants/aap_assets.dart';
// class ProfileImagePicker extends StatelessWidget {
//   final File? imageFile;
//   final double size;
//
//   const ProfileImagePicker({
//     super.key,
//     this.imageFile,
//     this.size = 169,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         color: AppTheme.uploadContainerColor,
//         borderRadius: BorderRadius.circular(99999),
//         border: Border.all(
//           color: AppTheme.backArrowBorderColor,
//           width: 1,
//         ),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(99999),
//         child: imageFile != null
//             ? Image.file(
//           imageFile!,
//           fit: BoxFit.cover,
//         )
//             : Center(
//           child: Image.asset(
//             AppAssets.uploadImageIcon,
//             width: 40,
//             height: 40,
//             fit: BoxFit.contain,
//           ),
//         ),
//       ),
//     );
//   }
// }