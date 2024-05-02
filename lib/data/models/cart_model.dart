import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  // Map productQuantity(products) {
  //   var quantity = {};
  //   for (Product product in products) {
  //     if (!quantity.containsKey(product)) {
  //       quantity[product] = 1;
  //     } else {
  //       quantity[product] += 1;
  //     }
  //   }
  //   return quantity;
  // }

  // double get subTotal => products.fold(
  //     0, (previousValue, product) => previousValue + product.price);

  // double deliveryFee() {
  //   if (subTotal >= 8000.0) {
  //     return 0.0;
  //   } else {
  //     return 1000.0;
  //   }
  // }

  // double total() {
  //   return subTotal + deliveryFee();
  // }

  // String freeDelivery() {
  //   if (subTotal >= 8000) {
  //     return 'You have Free Delivery';
  //   } else {
  //     double missing = 8000 - subTotal;
  //     return 'Add \$${missing.toStringAsFixed(0)} for FREE Delivery';
  //   }
  // }

  @override
  List<Object?> get props => [products];

  // static List<Product> cartProducts = [
  //   Product(
  //     id: 1, name: 'Soft Drink #1',
  //     description: 'desc...', category: 'Soft Drink',
  //     // imageUrl: 'assets/products/product_1.jpeg',

  //     images: [
  //       'https://images.unsplash.com/photo-1581006852262-e4307cf6283a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHNvZnQlMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
  //     ],
  //     sizes: [
  //       '40',
  //       '41',
  //       '42',
  //       '43',
  //       '44',
  //       '45',
  //     ],
  //     price: 2.99,
  //     quantity: 12, isRecommended: true,
  //     isPopular: false,
  //   ),
  //   Product(
  //     id: 2, name: 'Soft Drink #2',
  //     description: 'desc...', category: 'Soft Drink',
  //     // imageUrl: 'assets/products/product_2.jpeg',

  //     images: [
  //       'https://images.unsplash.com/photo-1526424382096-74a93e105682?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHNvZnQlMjBkcmlua3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
  //     ],
  //     sizes: [
  //       '40',
  //       '41',
  //       '42',
  //       '43',
  //       '44',
  //       '45',
  //     ],
  //     price: 2.99,
  //     quantity: 12, isRecommended: false,
  //     isPopular: true,
  //   ),
  // ];

}
