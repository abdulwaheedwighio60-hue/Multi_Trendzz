import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class FlashSaleProductCardWidget extends StatelessWidget {
  const FlashSaleProductCardWidget({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
    this.rating = '4.9',
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteTap,
  });

  final String imagePath;
  final String productName;
  final String price;
  final String rating;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 150.w,
                  height: 155.h,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: Image.network(
                      imagePath,
                      width: 150.w,
                      height: 155.h,
                      fit: BoxFit.cover,
                      loadingBuilder: (
                          BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress,
                          ) {
                        if (loadingProgress == null) {
                          return child;
                        }

                        return Center(
                          child: SizedBox(
                            width: 24.w,
                            height: 24.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.w,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (
                          BuildContext context,
                          Object error,
                          StackTrace? stackTrace,
                          ) {
                        return Center(
                          child: Icon(
                            Icons.image_not_supported_outlined,
                            color: AppColors.textHint,
                            size: 34.sp,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: InkWell(
                    onTap: onFavoriteTap,
                    customBorder: const CircleBorder(),
                    child: Container(
                      width: 34.w,
                      height: 34.w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.06),
                            blurRadius: 8.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: Icon(
                        isFavorite ? Iconsax.heart5 : Iconsax.heart,
                        color: AppColors.primaryColor,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            Row(
              children: [
                Expanded(
                  child: Text(
                    productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                Icon(
                  Icons.star,
                  color: const Color(0xFFFFB800),
                  size: 15.sp,
                ),

                Text(
                  rating,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            SizedBox(height: 5.h),

            Text(
              price,
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.textPrimary,
                fontSize: 15.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}