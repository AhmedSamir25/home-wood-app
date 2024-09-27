class ProductDetailsModel {
  String? msg;
  List<Products>? products;
  String? statusText;

  ProductDetailsModel({this.msg, this.products, this.statusText});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    statusText = json['statusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['statusText'] = statusText;
    return data;
  }
}

class Products {
  int? productId;
  String? productName;
  double? productPrice;
  double? productRating;
  int? productRateCount;
  String? productDescription;
  String? productImage;
  int? categoryId;
  String? categoryName;
  bool? inCart;
  bool? isFavorite;

  Products(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productRating,
      this.productRateCount,
      this.productDescription,
      this.productImage,
      this.categoryId,
      this.categoryName,
      this.inCart,
      this.isFavorite});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productRating = json['product_rating'];
    productRateCount = json['product_rate_count'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    categoryId = json['category_id'];
    categoryName = json["category_name"];
    inCart = json["is_in_cart"];
    isFavorite = json["is_favorite"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_rating'] = productRating;
    data['product_rate_count'] = productRateCount;
    data['product_description'] = productDescription;
    data['product_image'] = productImage;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['is_in_cart'] = inCart;
    data['is_favorite'] = isFavorite;
    return data;
  }
}