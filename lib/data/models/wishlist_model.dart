import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_store_app1/data/models/models.dart';
import 'package:equatable/equatable.dart';

// import '../../data/models/product_model.dart';
// import 'product_model.dart';

class WishList extends Equatable {
  final List<Product> products;

  const WishList({required this.products});

  @override
  List<Object?> get props => [products];

  static WishList fromSnapshot(DocumentSnapshot snapshot) {
    WishList wishlist = WishList(
      // products: snapshot['products'],
      products: List<Product>.from(
          snapshot['products']?.map((x) => Product.fromMap(x))),
    );
    return wishlist;
  }

  // factory WishList.fromMap(Map<String, dynamic> map) {
  //   return WishList(
  //     products: List<Product>.from(map['products']?.map((x) => Product.fromMap(x))),
  //   );
  // }

  Map<String, Object> toDocument() {
    return {
      'products': products
          .map((product) => {
                'id': product.id,
                'name': product.name,
                'description': product.description,
                'category': product.category,
                'images': product.images,
                'sizes': product.sizes,
                'price': product.price,
                'quantity': product.quantity,
                'isRecommended': product.isRecommended,
                'isPopular': product.isPopular,
              })
          .toList(),
    };
  }
}
