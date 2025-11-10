// import 'package:eventori/constants/app_text_style.dart';
// import 'package:flutter/material.dart';
// import '../../../../../AppTheme/app_theme.dart';
// import '../../../../../app_widgets/custom_image_handler.dart';
//
// class CollaboratorCard extends StatelessWidget {
//   final Collaborator collaborator;
//
//   const CollaboratorCard({
//     Key? key,
//     required this.collaborator,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 12.0),
//       child: Container(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   width: 44,
//                   height: 44,
//                   decoration: BoxDecoration(
//                     color: AppTheme.denimBlueColor,
//                     shape: BoxShape.circle,
//                   ),
//                   child: ClipOval(
//                     child: CustomImageHandler(
//                       imagePath: collaborator.imagePath,
//                       width: 44,
//                       height: 44,
//                       // fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 0,
//                   right: 4,
//                   child: Container(
//                     width: 10,
//                     height: 10,
//                     decoration: BoxDecoration(
//                       color: collaborator.isOnline
//                           ? AppTheme.greenColor
//                           : AppTheme.redColor,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             // Name
//             Text(
//               collaborator.name,
//               style: AppTextStyle.f12W400DSBColorTextStyle,
//               textAlign: TextAlign.center,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//             Text(
//               collaborator.role ??
//                   (collaborator.isOnline
//                       ? 'Online'
//                       : collaborator.lastActive ?? 'Offline'),
//               style: AppTextStyle.f10W400SGColorTextStyle,
//               textAlign: TextAlign.center,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../../../../AppTheme/app_theme.dart';
import '../../../../../app_widgets/custom_image_handler.dart';

class CollaboratorCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final bool isOnline;
  final String? lastActive;
  final String? role;

  const CollaboratorCard({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.isOnline,
    this.lastActive,
    this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.denimBlueColor,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: CustomImageHandler(
                    imagePath: imagePath,
                    width: 44,
                    height: 44,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 4,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: isOnline ? AppTheme.greenColor : AppTheme.redColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: AppTextStyle.f12W400DSBColorTextStyle,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            role ?? (isOnline ? 'Online' : lastActive ?? 'Offline'),
            style: AppTextStyle.f10W400SGColorTextStyle,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}