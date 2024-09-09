class BannerModel {
  List<Banner>? banners;
  String? msg;
  String? statusText;

  BannerModel({this.banners, this.msg, this.statusText});

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
      msg: json['msg'] as String?,
      statusText: json['statusText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banners': banners?.map((e) => e.toJson()).toList(),
      'msg': msg,
      'statusText': statusText,
    };
  }
}

class Banner {
  int? bannerId;
  String? bannerImage;

  Banner({this.bannerId, this.bannerImage});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      bannerId: json['banner_id'] as int?,
      bannerImage: json['banner_image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banner_id': bannerId,
      'banner_image': bannerImage,
    };
  }
}
