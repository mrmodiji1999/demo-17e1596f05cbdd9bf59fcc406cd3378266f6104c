// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

PostDataModel welcomeFromJson(String str) => PostDataModel.fromMap(json.decode(str));

String welcomeToJson(PostDataModel data) => json.encode(data.toMap());

class PostDataModel {
    List<Cart> carts;
    int total;
    int skip;
    int limit;

    PostDataModel({
        required this.carts,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory PostDataModel.fromMap(Map<String, dynamic> json) => PostDataModel(
        carts: List<Cart>.from(json["carts"].map((x) => Cart.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toMap() => {
        "carts": List<dynamic>.from(carts.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Cart {
    int id;
    List<Product> products;
    int total;
    int discountedTotal;
    int userId;
    int totalProducts;
    int totalQuantity;

    Cart({
        required this.id,
        required this.products,
        required this.total,
        required this.discountedTotal,
        required this.userId,
        required this.totalProducts,
        required this.totalQuantity,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        discountedTotal: json["discountedTotal"],
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
    };
}

class Product {
    int id;
    String title;
    int price;
    int quantity;
    int total;
    double discountPercentage;
    int discountedPrice;
    String thumbnail;

    Product({
        required this.id,
        required this.title,
        required this.price,
        required this.quantity,
        required this.total,
        required this.discountPercentage,
        required this.discountedPrice,
        required this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedPrice: json["discountedPrice"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedPrice": discountedPrice,
        "thumbnail": thumbnail,
    };
}
