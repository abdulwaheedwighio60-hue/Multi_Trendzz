import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


  int selectedImageIndex = 0;
  int selectedColorIndex = 0;
  bool isFavorite = false;
  bool isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.lightColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
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
                // context.go(AppRoutes.rootScreen);
              },
            ),
          ),
          title: Text(
            "My Cart",
            style: AppTextStyles.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          // actions: [
          //   Padding(
          //     padding: EdgeInsets.only(
          //       right: 14.w,
          //       top: 8.h,
          //       bottom: 8.h,
          //     ),
          //     child: CustomBackButtonWidget(
          //       icon: isFavorite ? Iconsax.heart5 : Iconsax.heart,
          //       iconColor: isFavorite
          //           ? AppColors.primaryColor
          //           : AppColors.textPrimary,
          //       onTap: () {
          //         setState(() {
          //           isFavorite = !isFavorite;
          //         });
          //       },
          //     ),
          //   ),
          // ],
        ),

        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(

              ),
              child: Row(
                children: [

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
