import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/services/image_picker_service.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/core/widgets/custom_back_button_widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {


  File? _profileImage;

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
          backgroundColor: AppColors.background,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomBackButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [

                Text(
                  AppStrings.completeYourProfileString,
                  style: AppTextStyles.headlineLarge.copyWith(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h,),
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.completeProfileDescription,
                  style: AppTextStyles.bodyLarge.copyWith(
                    fontSize: 15.sp
                  ),
                ),
                SizedBox(height: 30.h,),
                GestureDetector(
                  onTap: ()async{
                    final image = await ImagePickerService.instance.pickImage(context);

                    if(image != null){
                      setState(() {
                        _profileImage = image;
                      });
                    }

                  },
                  child: Stack(
                    children: [
                      Positioned(
                        right: 5,
                        bottom: 5,

                        child: Container(
                          width: 35.w,
                          height: 35.h,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Iconsax.edit,
                              color: AppColors.lightColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 130.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                          color: AppColors.greyColor.withValues(
                            alpha: 0.20,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.person,size: 55.sp,color: AppColors.primaryColor,),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
