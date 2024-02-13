import 'package:craftybay/presentation/state_holders/category_controller.dart';
import 'package:craftybay/presentation/state_holders/home_banner_controller.dart';
import 'package:craftybay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay/presentation/state_holders/special_product_controller.dart';
import 'package:craftybay/presentation/ui/screens/carts_screen.dart';
import 'package:craftybay/presentation/ui/screens/category_screen.dart';
import 'package:craftybay/presentation/ui/screens/home_screen.dart';
import 'package:craftybay/presentation/ui/screens/wishlist_screen.dart';
import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartsScreen(),
    const WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeBannerController>().homeBannerList();
      Get.find<CategoryController>().getCategoryList();
      Get.find<PopularProductController>().getPopularProductList();
      Get.find<SpecialProductController>().getSpecialProductList();
      Get.find<NewProductController>().getNewProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screen[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            selectedItemColor: CraftyBayAppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            onTap: controller.changeIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: "Category"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Carts"),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Wishlist"),
            ],
          ),
        );
      }
    );
  }
}
