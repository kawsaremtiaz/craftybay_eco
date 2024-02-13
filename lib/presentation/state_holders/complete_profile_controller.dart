import 'package:craftybay/data/models/check_profile_data.dart';
import 'package:craftybay/data/models/create_profile_params.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:craftybay/presentation/state_holders/catch_auth_controller.dart';
import 'package:get/get.dart';

class CreateProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  ProfileData _profileData = ProfileData();
  ProfileData get profile => _profileData;

  Future<bool> createProfileData(String token, CreateProfileParams params) async {
    _inProgress = true;
    update();
    final response = await NetworkCaller()
        .postRequest(url: Urls.createProfile, token: token, body: params.toJson());
    _inProgress = false;
    if (response.isSuccess) {
      _profileData = ProfileData.fromJson(response.responseData['data']);
      await Get.find<CatchAuthController>().saveUserDetails(token, profile);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
