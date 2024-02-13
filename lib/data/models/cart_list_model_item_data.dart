import 'dart:convert';

import 'package:craftybay/data/models/product_model.dart';

// class CartItem {
//   int? id;
//   String? email;
//   int? productId;
//   String? color;
//   String? size;
//   String? createdAt;
//   String? updatedAt;
//   ProductModel? product;
//   int quantity = 1;
//
//   CartItem(
//       {this.id,
//         this.email,
//         this.productId,
//         this.color,
//         this.size,
//         this.createdAt,
//         this.updatedAt,
//         this.product});
//
//   CartItem.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     productId = json['product_id'];
//     color = json['color'];
//     size = json['size'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     product =
//     json['product'] != null ? ProductModel.fromJson(json['product']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['email'] = email;
//     data['product_id'] = productId;
//     data['color'] = color;
//     data['size'] = size;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     if (product != null) {
//       data['product'] = product!.toJson();
//     }
//     return data;
//   }
// }

class CartListModelItemData {
  int? id;
  int? userId;
  int? productId;
  String? color;
  String? size;
  int? qty;
  String? price;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  CartListModelItemData(
      {this.id,
        this.userId,
        this.productId,
        this.color,
        this.size,
        this.qty,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.product});

  CartListModelItemData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    color = json['color'];
    size = json['size'];
    qty = int.tryParse(json['qty']) ?? 1;
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['color'] = color;
    data['size'] = size;
    data['qty'] = qty;
    return jsonEncode(data);
  }
}