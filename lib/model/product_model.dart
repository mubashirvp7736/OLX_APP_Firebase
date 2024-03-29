import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? title;
  String? place;
  String? description;
  String? category;
  String? image;
  String? price;
  List<String> wishList;

  ProductModel({
    this.id,
    this.title,
    this.place,
    this.image,
    this.price,
    this.description,
    this.category,
    required this.wishList,
  });

  factory ProductModel.fromJson(String id, Map<String, dynamic> json) {
    return ProductModel(
      id: id,
      category: json['category'],
      image: json['image'],
      price: json['price'],
      place: json["place"],
      description: json['description'],
      title: json['title'],
      wishList: List<String>.from(json['wishList'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category,
      'image': image,
      'price': price,
      'description': description,
      'title': title,
      'wishList': wishList,
      "place": place,
    };
  }
}
