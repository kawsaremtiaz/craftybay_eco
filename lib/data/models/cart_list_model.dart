import 'package:craftybay/data/models/cart_list_model_item_data.dart';

// class CartListModel {
//   String? msg;
//   List<CartItem>? cartItemList;
//
//   CartListModel({this.msg, this.cartItemList});
//
//   CartListModel.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     if (json['data'] != null) {
//       cartItemList = <CartItem>[];
//       json['data'].forEach((v) {
//         cartItemList!.add(CartItem.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['msg'] = msg;
//     if (cartItemList != null) {
//       data['data'] = cartItemList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class CartListModels {
  String? msg;
  List<CartListModelItemData>? cartListModelItemData;

  CartListModels({this.msg, this.cartListModelItemData});

  CartListModels.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      cartListModelItemData = <CartListModelItemData>[];
      json['data'].forEach((v) {
        cartListModelItemData!.add(CartListModelItemData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (cartListModelItemData != null) {
      data['data'] = cartListModelItemData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



