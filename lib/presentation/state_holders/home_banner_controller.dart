import 'package:craftybay/data/models/home_banner_list.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class HomeBannerController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  HomeBanner _homeBanner = HomeBanner();
  HomeBanner get homeBanner => _homeBanner;

  Future<bool> homeBannerList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.homeBanner);
    _inProgress = false;
    if(response.isSuccess){
      _homeBanner = HomeBanner.fromJson(response.responseData);
      update();
      isSuccess = true;
    } else{
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}