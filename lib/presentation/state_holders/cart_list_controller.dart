import 'package:craftybay/data/models/cart_list_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  CartListModels _cartListModels = CartListModels();
  CartListModels get cartListModels => _cartListModels;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
    await NetworkCaller().getRequest(Urls.cartList,);
    if(response.isSuccess){
      _cartListModels = CartListModels.fromJson(response.responseData);
      isSuccess = true;
    } else{
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}