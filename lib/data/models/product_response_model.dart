import 'dart:convert';

class ProductResponseModel {
    String? status;
    String? massage;
    List<Product>? data;

    ProductResponseModel({
        this.status,
        this.massage,
        this.data,
    });

    factory ProductResponseModel.fromJson(String str) => ProductResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductResponseModel.fromMap(Map<String, dynamic> json) => ProductResponseModel(
        status: json["status"],
        massage: json["massage"],
        data: json["data"] == null ? [] : List<Product>.from(json["data"]!.map((x) => Product.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "massage": massage,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Product {
    int? id;
    String? name;
    String? description;
    int? price;
    double? rating;
    String? category;
    String? imageUrl;
    DateTime? createdAt;
    DateTime? updatedAt;

    Product({
        this.id,
        this.name,
        this.description,
        this.price,
        this.rating,
        this.category,
        this.imageUrl,
        this.createdAt,
        this.updatedAt,
    });

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"]?.toDouble(),
        category:json["category"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "rating": rating,
        "category": category,
        "image_url": imageUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

