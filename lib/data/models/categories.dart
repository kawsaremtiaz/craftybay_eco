import 'package:craftybay/data/models/categories_list.dart';

class Categories {
  String? msg;
  List<CatagoryListItem>? categoryList;

  Categories({this.msg, this.categoryList});

  Categories.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      categoryList = <CatagoryListItem>[];
      json['data'].forEach((v) {
        categoryList!.add(CatagoryListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (categoryList != null) {
      data['data'] = categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


