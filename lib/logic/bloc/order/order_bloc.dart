import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRepository _orderRepository;
  StreamSubscription? _orderSubscription;

  OrderBloc({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(OrderLoading()) {
    on<LoadOrders>((event, emit) => _onLoadOrders(event, emit));
    on<UpdateOrders>((event, emit) => _onUpdateOrders(event, emit));
  }

  void _onLoadOrders(event, Emitter<OrderState> emit) {
    _orderSubscription?.cancel();
    _orderSubscription = _orderRepository.getAllOrders().listen((orders) {
      add(UpdateOrders(orders: orders));
    });
  }

  void _onUpdateOrders(event, Emitter<OrderState> emit) {
    emit(OrderLoaded(orders: event.orders));
  }
}
