import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:craftybay/presentation/state_holders/catch_auth_controller.dart';
import 'package:craftybay/presentation/state_holders/check_profile_data_controller.dart';
import 'package:get/get.dart';

class OtpVerifyController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  bool _navigateCompleteProfile = true;
  bool get navigateCompleteProfile => _navigateCompleteProfile;

  String _token ="";

  String get token => _token;

  Future<bool> otpVerify(String email, String otp) async {
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.otpVerify(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      _token = response.responseData['data'];
      await Future.delayed(const Duration(seconds: 2));
      final result =
          await Get.find<CheckProfileDataController>().checkProfileData(token);
      if (result) {
        _navigateCompleteProfile =
            Get.find<CheckProfileDataController>().isProfileCompleted == false;
        if (_navigateCompleteProfile == false) {
          await Get.find<CatchAuthController>().saveUserDetails(
              token, Get.find<CheckProfileDataController>().profile);
        }
      } else {
        _errorMessage = Get.find<CheckProfileDataController>().errorMessage;
        update();
        return false;
      }
      // save local catch
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
