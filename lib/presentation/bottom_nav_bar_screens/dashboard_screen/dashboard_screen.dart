import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_trendzz/core/constants/app_colors.dart';
import 'package:multi_trendzz/core/constants/app_images.dart';
import 'package:multi_trendzz/core/constants/app_texts.dart';
import 'package:multi_trendzz/core/model/category_item.dart';
import 'package:multi_trendzz/core/model/product_item.dart';
import 'package:multi_trendzz/core/routes/app_routes.dart';
import 'package:multi_trendzz/core/theme/app_text_style.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/category_button_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/dashboard_header_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/flash_sale_chip_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/flash_sale_header_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/flash_sale_product_card_widget.dart';
import 'package:multi_trendzz/presentation/bottom_nav_bar_screens/dashboard_screen/widgets/home_banner_slider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<CategoryItem> categories = [
    CategoryItem(
      title: 'Clothes',
      icon: FontAwesomeIcons.shirt,
    ),
    CategoryItem(
      title: 'Shoes',
      icon: FontAwesomeIcons.shoePrints,
    ),
    CategoryItem(
      title: 'Watches',
      icon: FontAwesomeIcons.clock,
    ),
    CategoryItem(
      title: 'Bags',
      icon: FontAwesomeIcons.bagShopping,
    ),
    CategoryItem(
      title: 'Electronics',
      icon: FontAwesomeIcons.mobileScreen,
    ),
  ];

  int selectedFlashSaleIndex = 0;

  final List<String> flashSaleChips = [
    'All',
    'Newest',
    'Popular',
    'Clothes',
    'Shoes',
  ];
  final List<ProductItem> allProducts = [
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Nike Pegasus 39',
      price: '\$90.00',
      rating: '4.9',
      category: 'Shoes',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Nike Air Max',
      price: '\$120.00',
      rating: '4.8',
      category: 'Shoes',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Men Shirt',
      price: '\$35.00',
      rating: '4.7',
      category: 'Clothes',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Smart Watch',
      price: '\$55.00',
      rating: '4.6',
      category: 'Popular',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Leather Bag',
      price: '\$70.00',
      rating: '4.5',
      category: 'Newest',
      isFavorite: true,
    ),
    ProductItem(
      imagePath: AppImages.shoesImage1,
      productName: 'Running Shoes',
      price: '\$85.00',
      rating: '4.7',
      category: 'Newest',
      isFavorite: true,
    ),
  ];

  List<ProductItem> get filteredProducts {
    final String selectedChip = flashSaleChips[selectedFlashSaleIndex];

    if (selectedChip == 'All') {
      return allProducts;
    }

    return allProducts.where((product) {
      return product.category.toLowerCase() == selectedChip.toLowerCase();
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Column(
          children: [
            /// Static Header
            const DashboardHeaderWidget(),

            /// Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 110.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14.h),

                    _buildSectionHeader(
                      title: AppStrings.specialOfferForYou,
                      showSeeAll: true,
                    ),

                    SizedBox(height: 8.h),

                    const HomeBannerSlider(),

                    SizedBox(height: 18.h),

                    _buildSectionHeader(
                      title: AppStrings.category,
                      showSeeAll: true,
                    ),

                    SizedBox(height: 12.h),

                    SizedBox(
                      height: 110.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: categories.length,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          final category = categories[index];

                          return Padding(
                            padding: EdgeInsets.only(right: 14.w),
                            child: CategoryButtonWidget(
                              title: category.title,
                              icon: category.icon,
                              onTap: () {
                                debugPrint(
                                  'Selected Category: ${category.title}',
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 10.h),

                    FlashSaleHeaderWidget(
                      initialDuration: const Duration(
                        hours: 2,
                        minutes: 12,
                        seconds: 56,
                      ),
                      onTimerFinished: () {
                        debugPrint('Flash sale finished');
                      },
                    ),

                    SizedBox(height: 8.h),

                    SizedBox(
                      height: 42.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        itemCount: flashSaleChips.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10.w);
                        },
                        itemBuilder: (context, index) {
                          return FlashSaleChipWidget(
                            title: flashSaleChips[index],
                            isSelected: selectedFlashSaleIndex == index,
                            onTap: () {
                              setState(() {
                                selectedFlashSaleIndex = index;
                              });
                            },
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 16.h),

                    if (filteredProducts.isEmpty)
                      _buildEmptyWishlist()
                    else
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(
                          14.w,
                          0,
                          14.w,
                          20.h,
                        ),
                        itemCount: filteredProducts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 0.80,
                        ),
                        itemBuilder: (context, index) {
                          final ProductItem product = filteredProducts[index];

                          return FlashSaleProductCardWidget(
                            imagePath: product.imagePath,
                            productName: product.productName,
                            price: product.price,
                            rating: product.rating,
                            isFavorite: product.isFavorite,
                            onTap: () {
                              debugPrint('Product clicked: ${product.productName}');
                              context.go(AppRoutes.productDetailScreen);
                            },
                            onFavoriteTap: () {
                              debugPrint('Favorite clicked: ${product.productName}');
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildEmptyWishlist() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border_rounded,
              color: AppColors.textHint,
              size: 70.sp,
            ),

            SizedBox(height: 16.h),

            Text(
              'No products found',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineMedium.copyWith(
                color: AppColors.textPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 8.h),

            Text(
              'There are no wishlist items available in this category.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    bool showSeeAll = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.headlineMedium.copyWith(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          if (showSeeAll)
            Text(
              AppStrings.seeAll,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.primaryColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}