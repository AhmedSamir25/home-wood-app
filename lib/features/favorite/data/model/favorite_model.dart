class FavoriteModel {
  int? productId;
  int? userId;

  FavoriteModel({this.productId, this.userId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['user_id'] = userId;
    return data;
  }
}