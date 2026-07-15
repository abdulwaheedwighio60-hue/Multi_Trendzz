import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_images.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class ProceedToCheckOutScreen extends StatefulWidget {
  const ProceedToCheckOutScreen({super.key});

  @override
  State<ProceedToCheckOutScreen> createState() =>
      _ProceedToCheckOutScreenState();
}

class _ProceedToCheckOutScreenState extends State<ProceedToCheckOutScreen> {
  int selectedAddressIndex = 0;
  int selectedShippingIndex = 0;

  final List<ShippingAddressModel> addresses = [
    ShippingAddressModel(
      title: 'Home',
      address: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
    ),
    ShippingAddressModel(
      title: 'Office',
      address: '4517 Washington Ave. Manchester, Kentucky 39495',
    ),
    ShippingAddressModel(
      title: 'Apartment',
      address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
    ),
  ];

  final List<ShippingTypeModel> shippingTypes = [
    ShippingTypeModel(
      title: 'Economy',
      subtitle: 'Estimated Arrival',
      date: '25 September 2023',
      price: 5.00,
    ),
    ShippingTypeModel(
      title: 'Regular',
      subtitle: 'Estimated Arrival',
      date: '20 September 2023',
      price: 10.00,
    ),
    ShippingTypeModel(
      title: 'Express',
      subtitle: 'Estimated Arrival',
      date: '18 September 2023',
      price: 18.00,
    ),
  ];

  final List<CheckoutOrderItemModel> orderItems = [
    CheckoutOrderItemModel(
      imagePath: AppImages.shoesImage1,
      title: 'Light Brown Coat',
      category: 'Clothes',
      price: 120.00,
    ),
    CheckoutOrderItemModel(
      imagePath: AppImages.shoesImage1,
      title: 'Nike Pegasus 39',
      category: 'Shoes',
      price: 90.00,
    ),
    CheckoutOrderItemModel(
      imagePath: AppImages.shoesImage1,
      title: 'Nike Pegasus',
      category: 'Shoes',
      price: 85.00,
    ),
  ];

  ShippingAddressModel get selectedAddress => addresses[selectedAddressIndex];

  ShippingTypeModel get selectedShipping => shippingTypes[selectedShippingIndex];

  void _showAddressSheet() {
    _showSelectionSheet(
      title: 'Change Shipping Address',
      itemCount: addresses.length,
      selectedIndex: selectedAddressIndex,
      itemBuilder: (index) {
        final item = addresses[index];

        return _SelectionTile(
          icon: Iconsax.location,
          title: item.title,
          subtitle: item.address,
          isSelected: selectedAddressIndex == index,
          onTap: () {
            setState(() {
              selectedAddressIndex = index;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showShippingTypeSheet() {
    _showSelectionSheet(
      title: 'Choose Shipping Type',
      itemCount: shippingTypes.length,
      selectedIndex: selectedShippingIndex,
      itemBuilder: (index) {
        final item = shippingTypes[index];

        return _SelectionTile(
          icon: Iconsax.box,
          title: item.title,
          subtitle: '${item.subtitle}  ${item.date}',
          trailingText: '\$${item.price.toStringAsFixed(2)}',
          isSelected: selectedShippingIndex == index,
          onTap: () {
            setState(() {
              selectedShippingIndex = index;
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  void _showSelectionSheet({
    required String title,
    required int itemCount,
    required int selectedIndex,
    required Widget Function(int index) itemBuilder,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
        ),
      ),
      builder: (context) {
        return SafeArea(
          top: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: AppColors.borderColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),

                SizedBox(height: 18.h),

                Text(
                  title,
                  style: AppTextStyles.headlineMedium.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),

                SizedBox(height: 16.h),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: itemCount,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemBuilder: (context, index) {
                    return itemBuilder(index);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _continueToPayment() {
    debugPrint('Selected Address: ${selectedAddress.title}');
    debugPrint('Selected Shipping: ${selectedShipping.title}');

    // TODO: Navigate payment screen
    // context.go(AppRoutes.paymentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightColor,
        appBar: AppBar(
          backgroundColor: AppColors.lightColor,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          leadingWidth: 60.w,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              top: 8.h,
              bottom: 8.h,
            ),
            child: CustomBackButtonWidget(
              onTap: () {
                context.go(AppRoutes.rootScreen);
              },
            ),
          ),
          title: Text(
            'Checkout',
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  10.h,
                  20.w,
                  110.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Shipping Address'),

                    SizedBox(height: 14.h),

                    _buildAddressCard(),

                    SizedBox(height: 22.h),

                    Divider(
                      color: AppColors.borderColor,
                      thickness: 1.h,
                    ),

                    SizedBox(height: 20.h),

                    _buildSectionTitle('Choose Shipping Type'),

                    SizedBox(height: 14.h),

                    _buildShippingTypeCard(),

                    SizedBox(height: 22.h),

                    Divider(
                      color: AppColors.borderColor,
                      thickness: 1.h,
                    ),

                    SizedBox(height: 20.h),

                    _buildSectionTitle('Order List'),

                    SizedBox(height: 16.h),

                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: orderItems.length,
                      separatorBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          child: Divider(
                            color: AppColors.borderColor,
                            thickness: 1.h,
                          ),
                        );
                      },
                      itemBuilder: (context, index) {
                        final item = orderItems[index];

                        return _CheckoutOrderItemWidget(item: item);
                      },
                    ),
                  ],
                ),
              ),
            ),

            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.textPrimary,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildAddressCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _CircleIcon(icon: Iconsax.location),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedAddress.title,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                selectedAddress.address,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 13.sp,
                  height: 1.25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 10.w),

        _ChangeButton(onTap: _showAddressSheet),
      ],
    );
  }

  Widget _buildShippingTypeCard() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _CircleIcon(icon: Iconsax.box),

        SizedBox(width: 12.w),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedShipping.title,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 4.h),

              RichText(
                text: TextSpan(
                  text: '${selectedShipping.subtitle}  ',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: selectedShipping.date,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 10.w),

        _ChangeButton(onTap: _showShippingTypeSheet),
      ],
    );
  }

  Widget _buildBottomButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20.w,
        12.h,
        20.w,
        24.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.r),
          topRight: Radius.circular(18.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 20.r,
            offset: Offset(0, -8.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 56.h,
          child: ElevatedButton(
            onPressed: _continueToPayment,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.r),
              ),
            ),
            child: Text(
              'Continue to Payment',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleIcon extends StatelessWidget {
  const _CircleIcon({
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 30.w,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.08),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.primaryColor,
        size: 18.sp,
      ),
    );
  }
}

class _ChangeButton extends StatelessWidget {
  const _ChangeButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: AppColors.primaryColor,
      ),
      child: Text(
        'CHANGE',
        style: AppTextStyles.bodySmall.copyWith(
          color: AppColors.primaryColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _CheckoutOrderItemWidget extends StatelessWidget {
  const _CheckoutOrderItemWidget({
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

class _SelectionTile extends StatelessWidget {
  const _SelectionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
    this.trailingText,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        padding: EdgeInsets.all(14.sp),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.08)
              : AppColors.background,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryColor
                : AppColors.borderColor,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            _CircleIcon(icon: icon),

            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13.sp,
                      height: 1.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            if (trailingText != null) ...[
              SizedBox(width: 8.w),
              Text(
                trailingText!,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],

            SizedBox(width: 8.w),

            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: isSelected
                  ? AppColors.primaryColor
                  : AppColors.textHint,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class ShippingAddressModel {
  ShippingAddressModel({
    required this.title,
    required this.address,
  });

  final String title;
  final String address;
}

class ShippingTypeModel {
  ShippingTypeModel({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.price,
  });

  final String title;
  final String subtitle;
  final String date;
  final double price;
}

class CheckoutOrderItemModel {
  CheckoutOrderItemModel({
    required this.imagePath,
    required this.title,
    required this.category,
    required this.price,
  });

  final String imagePath;
  final String title;
  final String category;
  final double price;
}