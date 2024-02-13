import 'product_details_model_data.dart';

// class ProductDetails {
//   String? msg;
//   List<ProductDetailsModelData>? productDetailsData;
//
//   ProductDetails({this.msg, this.productDetailsData});
//
//   ProductDetails.fromJson(Map<String, dynamic> json) {
//     msg = json['msg'];
//     if (json['data'] != null) {
//       productDetailsData = <ProductDetailsModelData>[];
//       json['data'].forEach((v) {
//         productDetailsData!.add(ProductDetailsModelData.fromJson(v));
//       });
//     }
//   }
// }

class ProductDetailsByIdModel {
  String? msg;
  List<ProductDetailsByIdModelData>? productDetailsByIdModelData;

  ProductDetailsByIdModel({this.msg, this.productDetailsByIdModelData});

  ProductDetailsByIdModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      productDetailsByIdModelData = <ProductDetailsByIdModelData>[];
      json['data'].forEach((v) {
        productDetailsByIdModelData!.add(ProductDetailsByIdModelData.fromJson(v));
      });
    }
  }
}





// class Brand {
//   int? id;
//   String? brandName;
//   String? brandImg;
//   String? createdAt;
//   String? updatedAt;
//
//   Brand(
//       {this.id, this.brandName, this.brandImg, this.createdAt, this.updatedAt});
//
//   Brand.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     brandName = json['brandName'];
//     brandImg = json['brandImg'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['brandName'] = brandName;
//     data['brandImg'] = brandImg;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class Category {
//   int? id;
//   String? categoryName;
//   String? categoryImg;
//   String? createdAt;
//   String? updatedAt;
//
//   Category(
//       {this.id,
//         this.categoryName,
//         this.categoryImg,
//         this.createdAt,
//         this.updatedAt});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     categoryName = json['categoryName'];
//     categoryImg = json['categoryImg'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['categoryName'] = categoryName;
//     data['categoryImg'] = categoryImg;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

