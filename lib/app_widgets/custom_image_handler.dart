// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:eventori/constants/aap_assets.dart';
// import 'package:flutter/material.dart';
//
// import '../AppTheme/widgets/app_theme.dart';
//
// class CustomImageHandler extends StatelessWidget {
//   const CustomImageHandler({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//         imageUrl:myTeamImagePath??'',
//         placeholder: (context, url) =>
//             Center(
//                 child: CircularProgressIndicator(
//                   color: AppTheme.cyanColor,
//                 )
//             ),
//         errorWidget: (context, url, error) =>
//             Image.asset(AppAssets.basketball),
//         fit: BoxFit.cover,
//         // scale:20 ,
//         );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventori/constants/aap_assets.dart';
import 'package:flutter/material.dart';
import '../AppTheme/app_theme.dart';

class CustomImageHandler extends StatelessWidget {
  final String? imagePath;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final String? placeholderAsset;
  final String? errorAsset;
  final Color? loaderColor;
  final double? loaderSize;

  const CustomImageHandler({
    Key? key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholderAsset,
    this.errorAsset,
    this.loaderColor,
    this.loaderSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if imagePath is null or empty
    if (imagePath == null || imagePath!.isEmpty) {
      return _buildErrorWidget();
    }

    if (imagePath!.startsWith('http://') || imagePath!.startsWith('https://')) {
      return CachedNetworkImage(
        imageUrl: imagePath!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) => _buildPlaceholder(),
        errorWidget: (context, url, error) => _buildErrorWidget(),
      );
    } else {
      // Asset image
      return Image.asset(
        imagePath!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
      );
    }
  }

  /// Builds placeholder widget while image is loading
  Widget _buildPlaceholder() {
    if (placeholderAsset != null) {
      return Image.asset(
        placeholderAsset!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      );
    }

    return Center(
      child: SizedBox(
        width: loaderSize ?? 24,
        height: loaderSize ?? 24,
        child: CircularProgressIndicator(
          color: loaderColor ?? AppTheme.lightCyanColor,
          strokeWidth: 2,
        ),
      ),
    );
  }

  /// Builds error widget when image fails to load
  Widget _buildErrorWidget() {
    return Image.asset(
      errorAsset ?? AppAssets.userAvatarIcon,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}