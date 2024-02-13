import 'package:craftybay/data/models/categories.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Categories _categories = Categories();
  Categories get categories => _categories;


  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.categoryList);
    _inProgress = false;
    if(response.isSuccess){
      _categories = Categories.fromJson(response.responseData);
      isSuccess = true;
    } else{
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}