import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_store_app1/logic/bloc/wishlist/wishlist_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/product_model.dart';
import '../../../data/repositories/product/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  StreamSubscription? _productSubscription;

  ProductBloc(
      {required WishlistBloc wishlistBloc,
      required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductLoading()) {
    on<LoadProducts>((event, emit) => _onLoadProducts(event, emit));
    on<UpdateProducts>((event, emit) => _onUpdateProducts(event, emit));
  }

  void _onLoadProducts(event, Emitter<ProductState> emit) {
    _productSubscription?.cancel();
    _productSubscription =
        _productRepository.getAllProducts().listen((products) {
      add(UpdateProducts(products: products));
    });
  }

  void _onUpdateProducts(event, Emitter<ProductState> emit) {
    emit(ProductLoaded(products: event.products));
  }
}
