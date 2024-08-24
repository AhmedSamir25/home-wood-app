class BannerModel {
  List<Banners>? banners;
  String? msg;
  String? statusText;

  BannerModel({this.banners, this.msg, this.statusText});

  BannerModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    msg = json['msg'];
    statusText = json['statusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['statusText'] = statusText;
    return data;
  }
}

class Banners {
  int? bannerId;
  String? bannerImage;

  Banners({this.bannerId, this.bannerImage});

  Banners.fromJson(Map<String, dynamic> json) {
    bannerId = json['banner_id'];
    bannerImage = json['banner_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banner_id'] = bannerId;
    data['banner_image'] = bannerImage;
    return data;
  }
}
