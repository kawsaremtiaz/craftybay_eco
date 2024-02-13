import 'dart:convert';

import 'package:craftybay/data/models/check_profile_data.dart';
import 'package:craftybay/presentation/ui/screens/auth/email_verify_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatchAuthController extends GetxController {
  static String? token;
  static ProfileData? profle;

  Future<void> saveUserDetails(String t, ProfileData p) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("token", t);
    await sharedPreferences.setString("profile", jsonEncode(p.toJson()));
    token = t;
    profle = p;
  }

  Future<void> initialize() async {
    token = await _getToken();
    profle = await _getProfile();
  }

  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  bool get isTokenNotNull => token != null;

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  Future<ProfileData?> _getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? strProfile = sharedPreferences.getString('profile');
    if (strProfile == null) {
      return null;
    } else {
      return ProfileData.fromJson(jsonDecode(strProfile));
    }
  }

  static Future<void> clearAuthData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
  }

  static Future<void> goToLogin() async {
    Get.to(()=> const EmailVerifyScreen());
  }
}
