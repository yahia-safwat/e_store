import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/category_model.dart';
import '../../../data/repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>((event, emit) => _onLoadCategories(event, emit));
    on<UpdateCategories>((event, emit) => _onUpdateCategories(event, emit));
  }

  void _onLoadCategories(event, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel();
    _categorySubscription =
        _categoryRepository.getAllCategories().listen((categories) {
      add(UpdateCategories(categories: categories));
    });
  }

  void _onUpdateCategories(event, Emitter<CategoryState> emit) {
    emit(CategoryLoaded(categories: event.categories));
  }
}
