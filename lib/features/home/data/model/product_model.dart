class ProductModel {
  String? msg;
  Products? products;
  String? statusText;

  ProductModel({this.msg, this.products, this.statusText});

  ProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    products = json['products'] != null
        ? Products.fromJson(json['products'])
        : null;
    statusText = json['statusText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (products != null) {
      data['products'] = products!.toJson();
    }
    data['statusText'] = statusText;
    return data;
  }
}

class Products {
  bool? success;
  List<Data>? data;
  Pagination? pagination;

  Products({this.success, this.data, this.pagination});

  Products.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class Data {
  int? productId;
  String? productName;
  double? productPrice;
  double? productRating;
  int? productRateCount;
  String? productDescription;

  Data(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productRating,
      this.productRateCount,
      this.productDescription});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productRating = json['product_rating'];
    productRateCount = json['product_rate_count'];
    productDescription = json['product_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_price'] = productPrice;
    data['product_rating'] = productRating;
    data['product_rate_count'] = productRateCount;
    data['product_description'] = productDescription;
    return data;
  }
}

class Pagination {
  String? nextCursor;
  String? prevCursor;

  Pagination({this.nextCursor, this.prevCursor});

  Pagination.fromJson(Map<String, dynamic> json) {
    nextCursor = json['next_cursor'];
    prevCursor = json['prev_cursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['next_cursor'] = nextCursor;
    data['prev_cursor'] = prevCursor;
    return data;
  }
}