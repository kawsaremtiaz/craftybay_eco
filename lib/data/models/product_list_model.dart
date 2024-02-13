import 'package:craftybay/data/models/product_model.dart';

class ProductListModel {
  String? msg;
  List<ProductModel>? productDataList;

  ProductListModel({this.msg, this.productDataList});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDataList = <ProductModel>[];
      json['data'].forEach((v) {
        productDataList!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.productDataList != null) {
      data['data'] = this.productDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




