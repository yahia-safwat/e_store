import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  StreamSubscription? _subscription;

  NetworkBloc() : super(NetworkInitial()) {
    on<ListenConnection>(_listenConnection);
    on<ConnectionChanged>(_connectionChanged);
  }

  void _listenConnection(NetworkEvent event, Emitter<NetworkState> emit) {
    var isDeviceConnected = false;

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        isDeviceConnected
            ? ConnectionChanged(ConnectionSuccess())
            : ConnectionFailure();
      }
    });
  }

  void _connectionChanged(ConnectionChanged event, Emitter<NetworkState> emit) {
    emit(event.connection);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
