import 'package:craftybay/data/models/check_profile_data.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class CheckProfileDataController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  ProfileData _profileData = ProfileData();
  ProfileData get profile => _profileData;

  bool _isProfileCompleted = false;
  bool get isProfileCompleted => _isProfileCompleted;

  Future<bool> checkProfileData(
    String token,
  ) async {
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.checkProfile, token: token);
    _inProgress = false;
    if (response.isSuccess) {
      final profileData = response.responseData['data'];
      if (profileData?.isEmpty ?? true) {
        _isProfileCompleted = false;
      } else {
        _profileData = ProfileData.fromJson(profileData);
        _isProfileCompleted = true;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
