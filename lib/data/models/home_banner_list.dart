import 'package:craftybay/data/models/banner.dart';

class HomeBanner {
  String? msg;
  List<BannerItem>? bannerList;

  HomeBanner({this.msg, this.bannerList});

  HomeBanner.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      bannerList = <BannerItem>[];
      json['data'].forEach((v) {
        bannerList!.add(BannerItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.bannerList != null) {
      data['data'] = this.bannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


