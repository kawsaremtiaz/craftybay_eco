import 'package:craftybay/presentation/state_holders/catch_auth_controller.dart';
import 'package:craftybay/presentation/state_holders/category_controller.dart';
import 'package:craftybay/presentation/state_holders/home_banner_controller.dart';
import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay/presentation/state_holders/special_product_controller.dart';
import 'package:craftybay/presentation/ui/screens/auth/completed_profile_screen.dart';
import 'package:craftybay/presentation/ui/screens/auth/email_verify_screen.dart';
import 'package:craftybay/presentation/ui/utility/assets_content_path.dart';
import 'package:craftybay/presentation/ui/widgets/category_item.dart';
import 'package:craftybay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:craftybay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:craftybay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:craftybay/presentation/ui/widgets/home/section_title.dart';
import 'package:craftybay/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              searchTextField,
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeBannerController>(builder: (homeBannerController) {
                return Visibility(
                  visible: homeBannerController.inProgress == false,
                  replacement: const CenterCircularProgressIndicator(),
                  child: BannerCarousel(
                    bannerList:
                        homeBannerController.homeBanner.bannerList ?? [],
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'All Categories',
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'Populer',
                onTapSeeAll: () {
                },
              ),
              popularProductList,
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'Special',
                onTapSeeAll: () {},
              ),
              specialProductList,
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: 'New',
                onTapSeeAll: () {},
              ),
              newProductList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 110,
      child: GetBuilder<CategoryController>(builder: (categoryController) {
        return Visibility(
          visible: categoryController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: ListView.separated(
            itemCount: categoryController.categories.categoryList?.length ?? 0,
            scrollDirection: Axis.horizontal,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryItem(
                category: categoryController.categories.categoryList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  // SizedBox get specialProductList {
  //   return SizedBox(
  //     height: 200,
  //     child: ListView.separated(
  //       itemCount: 10,
  //       scrollDirection: Axis.horizontal,
  //       primary: false,
  //       shrinkWrap: true,
  //       itemBuilder: (context, index) {
  //         return ProductCardItem(product: null,
  //         );
  //       },
  //       separatorBuilder: (_, __) {
  //         return const SizedBox(
  //           width: 8,
  //         );
  //       },
  //     ),
  //   );
  // }

  // SizedBox get productList {
  //   return SizedBox(
  //     height: 200,
  //     child: ListView.separated(
  //       itemCount: 10,
  //       scrollDirection: Axis.horizontal,
  //       primary: false,
  //       shrinkWrap: true,
  //       itemBuilder: (context, index) {
  //         return const ProductCardItem(
  //           productDetailScreentitle: 'Product Details',
  //         );
  //       },
  //       separatorBuilder: (_, __) {
  //         return const SizedBox(
  //           width: 8,
  //         );
  //       },
  //     ),
  //   );
  // }
  SizedBox get popularProductList {
    return SizedBox(
      height: 200,
      child: GetBuilder<PopularProductController>(
          builder: (popularProductController) {
        return Visibility(
          visible: popularProductController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: ListView.separated(
            itemCount: popularProductController
                    .productListModel.productDataList?.length ??
                0,
            scrollDirection: Axis.horizontal,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCardItem(
                product: popularProductController
                    .productListModel.productDataList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get specialProductList {
    return SizedBox(
      height: 200,
      child: GetBuilder<SpecialProductController>(
          builder: (specialProductController) {
        return Visibility(
          visible: specialProductController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: ListView.separated(
            itemCount: specialProductController
                    .productListModel.productDataList?.length ??
                0,
            scrollDirection: Axis.horizontal,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCardItem(
                product: specialProductController
                    .productListModel.productDataList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  SizedBox get newProductList {
    return SizedBox(
      height: 200,
      child: GetBuilder<NewProductController>(builder: (newProductController) {
        return Visibility(
          visible: newProductController.inProgress == false,
          replacement: const CenterCircularProgressIndicator(),
          child: ListView.separated(
            itemCount:
                newProductController.productListModel.productDataList?.length ??
                    0,
            scrollDirection: Axis.horizontal,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCardItem(
                product: newProductController
                    .productListModel.productDataList![index],
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        );
      }),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        filled: true,
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: Colors.grey,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsContentPath.logoNav),
      centerTitle: false,
      actions: [
        CircleIconButton(
          onTap: () async {
            await CatchAuthController.clearAuthData();
            Get.offAll(() => const EmailVerifyScreen());
          },
          iconData: Icons.person,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {
            Get.to(CompletedProfileScreen());
          },
          iconData: Icons.phone_outlined,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_outlined,
        )
      ],
    );
  }
}
