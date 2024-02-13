
import 'dart:math';

import 'package:craftybay/data/models/cart_list_model_item_data.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:craftybay/presentation/state_holders/catch_auth_controller.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<bool> addToCart(
      int productId, String productColor, String productSize, int quantity,) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    CartListModelItemData inputParams = CartListModelItemData(productId: productId, color: productColor, size: productSize, qty: quantity);
    final response =
        await NetworkCaller().postRequest(url: Urls.addToCart, token: CatchAuthController.token, body: inputParams.toJson(),);
    if(response.isSuccess){
      isSuccess = true;
    } else{
      _errorMessage = response.errorMessage;
    }
    print(response.errorMessage.toString());
    _inProgress = false;
    update();
    return isSuccess;
  }
}
