
import 'package:craftybay/presentation/state_holders/add_to_cart_controller.dart';
import 'package:craftybay/presentation/state_holders/all_product_controller.dart';
import 'package:craftybay/presentation/state_holders/cart_list_controller.dart';
import 'package:craftybay/presentation/state_holders/catch_auth_controller.dart';
import 'package:craftybay/presentation/state_holders/category_controller.dart';
import 'package:craftybay/presentation/state_holders/check_profile_data_controller.dart';
import 'package:craftybay/presentation/state_holders/complete_profile_controller.dart';
import 'package:craftybay/presentation/state_holders/home_banner_controller.dart';
import 'package:craftybay/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay/presentation/state_holders/product_details_controller.dart';
import 'package:craftybay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:craftybay/presentation/state_holders/special_product_controller.dart';
import 'package:get/get.dart';

import 'presentation/state_holders/main_bottom_nav_controller.dart';
import 'presentation/state_holders/otp_verification_controller.dart';
import 'presentation/state_holders/popular_product_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies(){
    Get.put(MainBottomNavController());
    Get.put(SendEmailOtpController());
    Get.put(OtpVerifyController());
    Get.put(CheckProfileDataController());
    Get.put(CatchAuthController());
    Get.put(CreateProfileController());
    Get.put(HomeBannerController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(CartListController());
  }
}