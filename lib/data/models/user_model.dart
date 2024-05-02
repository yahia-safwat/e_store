import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String country;
  final String zipCode;
  final List cart;

  const User({
    this.id,
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.address = '',
    this.city = '',
    this.country = '',
    this.zipCode = '',
    this.cart = const [],
  });

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phone,
    String? address,
    String? city,
    String? country,
    String? zipCode,
    List? cart,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
      cart: cart ?? this.cart,
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      fullName: snap['fullName'],
      email: snap['email'],
      phone: snap['phone'],
      address: snap['address'],
      city: snap['city'],
      country: snap['country'],
      zipCode: snap['zipCode'],
      cart: snap['cart'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'id': id!,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
      'country': country,
      'zipCode': zipCode,
      'cart': cart,
    };
  }

  static const empty = User(id: '');

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        phone,
        address,
        city,
        country,
        zipCode,
        cart,
      ];

  // static User user = User(
  //   id: '2',
  //   fullName: 'ahmed',
  //   email: 'ahmed@smail.com',
  //   address: 'kh',
  //   city: 'khartoum',
  //   country: 'Sudan',
  //   zipCode: '11112',
  // );
}
