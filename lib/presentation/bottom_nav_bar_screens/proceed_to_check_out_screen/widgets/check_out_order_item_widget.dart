import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/shipping_model.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';

class CheckoutOrderItemWidget extends StatelessWidget {
  const CheckoutOrderItemWidget({
    required this.item,
  });

  final CheckoutOrderItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: AppColors.greyColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(
              item.imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),

        SizedBox(width: 14.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 5.h),

              Text(
                item.category,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 7.h),

              Text(
                '\$${item.price.toStringAsFixed(2)}',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
