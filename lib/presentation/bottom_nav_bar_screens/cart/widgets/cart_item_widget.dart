import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/model/cart_item_model.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/cart/widgets/QuantityButtonWIdget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  final CartItemModel item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.title),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onRemove(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 24.w),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Icon(
          Iconsax.trash,
          color: AppColors.primaryColor,
          size: 26.sp,
        ),
      ),
      child: Container(
        color: AppColors.lightColor,
        child: Row(
          children: [
            Container(
              width: 82.w,
              height: 82.w,
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

                  SizedBox(height: 8.h),

                  Text(
                    '\$${item.totalPrice.toStringAsFixed(2)}',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 10.w),

            Row(
              children: [
                QuantityButton(
                  icon: Icons.remove,
                  backgroundColor: AppColors.greyColor.withOpacity(0.08),
                  iconColor: AppColors.textPrimary,
                  onTap: onDecrease,
                ),

                SizedBox(width: 10.w),

                Text(
                  item.quantity.toString(),
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(width: 10.w),

                QuantityButton(
                  icon: Icons.add,
                  backgroundColor: AppColors.primaryColor,
                  iconColor: AppColors.white,
                  onTap: onIncrease,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
