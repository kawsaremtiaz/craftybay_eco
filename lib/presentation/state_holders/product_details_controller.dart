import 'package:craftybay/data/models/product_details_model.dart';
import 'package:craftybay/data/models/product_details_model_data.dart';
import 'package:craftybay/data/models/response_data.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  ProductDetailsByIdModel _productDetailsByIdModel = ProductDetailsByIdModel();

  ProductDetailsByIdModelData get productDetailsByIdModel =>
      _productDetailsByIdModel.productDetailsByIdModelData!.first;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final ResponseData response =
        await NetworkCaller().getRequest(Urls.productDetails(productId));
    if (response.isSuccess) {
      _productDetailsByIdModel = ProductDetailsByIdModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
