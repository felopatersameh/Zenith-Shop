class ShopDataHome {
  bool? status;
  String? message;
  DataHome? data;

  ShopDataHome.fromJason(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = DataHome.fromJason(json['data']);
  }
}

class DataHome {
  List<BannersData>? banners ;
  List<ProductsData>? products;

  DataHome.fromJason(Map<String, dynamic> json) {
    banners =json['banners'].forEach((element) {
      banners?.addAll(element);
    });
    products = json['products'].forEach((element) {
      products?.add(element);
    });
  }
}

class BannersData {
  int? id;
  String? image;

  BannersData.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductsData {
  int? id;
  String? image;
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  String? name;
  String? description;
  bool? infavorites;
  bool? incart;

  ProductsData.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    price = json['price'];
    oldprice = json['old_price'];
    discount = json['discount'];
    name = json['name'];
    description = json['description'];
    infavorites = json['in_favorites'];
    incart = json['in_cart'];
  }
}
