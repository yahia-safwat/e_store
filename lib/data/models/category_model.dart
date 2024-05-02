import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  final String iconUrl;

  const Category({
    required this.name,
    required this.imageUrl,
    required this.iconUrl,
  });

  static Category fromSnapshot(DocumentSnapshot snapshot) {
    Category category = Category(
      name: snapshot['name'],
      imageUrl: snapshot['imageUrl'],
      iconUrl: snapshot['iconUrl'],
    );
    return category;
  }

  @override
  List<Object?> get props => [name, imageUrl, iconUrl];
}
