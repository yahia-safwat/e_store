import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String description;
  final String category;
  final List<dynamic> images;
  final List<dynamic> sizes;
  final List<dynamic> favorites;
  final num price;
  final num quantity;
  final bool isRecommended;
  final bool isPopular;
  final bool isNew;

  const Product({
    required this.id,
    required this.uid,
    required this.name,
    required this.description,
    required this.category,
    required this.images,
    required this.sizes,
    required this.favorites,
    required this.price,
    required this.quantity,
    required this.isRecommended,
    required this.isPopular,
    required this.isNew,
  });

  static Product fromSnapshot(DocumentSnapshot snapshot) {
    Product product = Product(
      id: snapshot['id'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      description: snapshot['description'],
      category: snapshot['category'],
      images: snapshot['images'],
      sizes: snapshot['sizes'],
      favorites: snapshot['favorites'],
      price: snapshot['price'],
      quantity: snapshot['quantity'],
      isRecommended: snapshot['isRecommended'],
      isPopular: snapshot['isPopular'],
      isNew: snapshot['isNew'],
    );
    return product;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      images: List<dynamic>.from(map['images']),
      sizes: List<dynamic>.from(map['sizes']),
      favorites: List<dynamic>.from(map['favorites']),
      price: map['price'] ?? 0,
      quantity: map['quantity'] ?? 0,
      isRecommended: map['isRecommended'] ?? false,
      isPopular: map['isPopular'] ?? false,
      isNew: map['isNew'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'description': description,
      'category': category,
      'images': images,
      'sizes': sizes,
      'favorites': favorites,
      'price': price,
      'quantity': quantity,
      'isRecommended': isRecommended,
      'isPopular': isPopular,
      'isNew': isNew,
    };
  }

  Map<String, dynamic> toCartMap() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'description': description,
      'category': category,
      'images': images,
      'sizes': sizes,
      'favorites': [],
      'price': price,
      'quantity': quantity,
      'isRecommended': null,
      'isPopular': null,
      'isNew': null,
    };
  }

  @override
  List<Object?> get props => [
        id,
        uid,
        name,
        description,
        category,
        images,
        sizes,
        favorites,
        price,
        quantity,
        isRecommended,
        isPopular,
        isNew,
      ];
}
