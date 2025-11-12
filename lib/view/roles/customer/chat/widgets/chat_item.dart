// import 'package:eventori/AppTheme/app_theme.dart';
// import 'package:eventori/constants/aap_assets.dart';
// import 'package:eventori/constants/app_text_style.dart';
// import 'package:flutter/material.dart';
// import '../../../../../app_widgets/custom_image_handler.dart';
//
// class ChatItem extends StatelessWidget {
//   final String avatarUrl;
//   final String name;
//   final String lastMessage;
//   final int messageCount;
//   final VoidCallback? onTap;
//   final VoidCallback? onMenuTap;
//   final GlobalKey menuKey = GlobalKey();
//
//
//   ChatItem({
//     Key? key,
//     required this.avatarUrl,
//     required this.name,
//     required this.lastMessage,
//     this.messageCount = 0,
//     this.onTap,
//     this.onMenuTap,
//   }) : super(key: key);
//
//   // void _showMenu(BuildContext context, GlobalKey key) {
//   //   final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
//   //   final Offset offset = renderBox.localToGlobal(Offset.zero);
//   //   final Size size = renderBox.size;
//   //
//   //   showMenu(
//   //     context: context,
//   //     color: AppTheme.whiteColor,
//   //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//   //     position: RelativeRect.fromLTRB(
//   //       // offset.dx,
//   //       300,
//   //       offset.dy + size.height,
//   //       offset.dx + size.width,
//   //       offset.dy + size.height,
//   //     ),
//   //     items: [
//   //       PopupMenuItem(
//   //         child: Text("Delete chat",style: AppTextStyle.font14W400SGColorTextStyle,),
//   //       ),
//   //       PopupMenuItem(
//   //         child: Text("Mute Notification",style: AppTextStyle.font14W400SGColorTextStyle,),
//   //       ),
//   //     ],
//   //   );
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 16.0,right: 16, bottom: 8),
//       child: InkWell(
//         onTap: onTap,
//         child: Container(
//           // height: 9.h,
//           height: 64,
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           decoration: BoxDecoration(
//             color: AppTheme.whiteColor,
//             border: Border.all(
//               color: AppTheme.textfieldBorderColor,
//               width: 2,
//             ),
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: CustomImageHandler(
//                   imagePath: avatarUrl,
//                   width: 40,
//                   height: 40,
//                 ),
//               ),
//
//               const SizedBox(width: 12),
//
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       name,
//                       style: AppTextStyle.font14W600BColorTextStyle,
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       lastMessage,
//                       style: AppTextStyle.font12W500SGColorTextStyle,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//               ),
//
//
//               Row(
//                 children: [
//                   if (messageCount > 0)
//                     Container(
//                       width: 20,
//                       height: 20,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: AppTheme.greenColor,
//                       ),
//                       child: Center(
//                         child: Text(
//                           messageCount.toString(),
//                           style: AppTextStyle.font12W500WColorTextStyle
//                         ),
//                       ),
//                     ),
//                   const SizedBox(height: 8),
//
//                   // GestureDetector(
//                   //   key: menuKey,
//                   //   onTap: () => _showMenu(context, menuKey),
//                   //   child:
//                     Image.asset(
//                           AppAssets.moreVerticalIcon,
//                           width: 20,
//                           height: 20,
//                         ),
//                   // ),
//
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:eventori/AppTheme/app_theme.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../../../../app_widgets/custom_image_handler.dart';
import '../../../../../app_widgets/custom_pop_up_menu.dart';

class ChatItem extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String lastMessage;
  final int messageCount;
  final VoidCallback? onTap;
  final List<PopupMenuOption>? menuOptions;
  final GlobalKey menuKey = GlobalKey();

  ChatItem({
    Key? key,
    required this.avatarUrl,
    required this.name,
    required this.lastMessage,
    this.messageCount = 0,
    this.onTap,
    this.menuOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            border: Border.all(
              color: AppTheme.textfieldBorderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8),
              //   child: CustomImageHandler(
              //     imagePath: avatarUrl,
              //     width: 40,
              //     height: 40,
              //   ),
              // ),

              Container(
                decoration: BoxDecoration(
                  color: AppTheme.lightGrayishColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.lightGrayishColor,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CustomImageHandler(
                    imagePath: avatarUrl,
                    width: 40,
                    height: 40,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: AppTextStyle.f14W600BColorTextStyle,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastMessage,
                      style: AppTextStyle.f12W500SGColorTextStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  if (messageCount > 0) ...[
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppTheme.greenColor,
                      ),
                      child: Center(
                        child: Text(
                          messageCount.toString(),
                          style: AppTextStyle.f12W500WColorTextStyle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  if (menuOptions != null && menuOptions!.isNotEmpty)
                    CustomPopupMenu(
                      menuKey: menuKey,
                      options: menuOptions!,
                      child: Image.asset(
                        AppAssets.moreVerticalIcon,
                        width: 20,
                        height: 20,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}