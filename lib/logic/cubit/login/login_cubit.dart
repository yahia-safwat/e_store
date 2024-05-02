import 'package:bloc/bloc.dart';
import 'package:e_store_app1/data/models/login_response.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../data/repositories/repositories.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  String loginErrorMsg = '';

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: LoginStatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));
  }

  Future<void> logInWithCredentials() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      LoginResponse? loginResponse =
          await _authRepository.logInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      if (loginResponse!.isauthorized) {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        loginErrorMsg = loginResponse.message;
        emit(state.copyWith(status: LoginStatus.error));
      }
    } catch (_) {
      loginErrorMsg = 'Check Internet Connection!';
      emit(state.copyWith(status: LoginStatus.error));
    }
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      LoginResponse? loginResponse = await _authRepository.logInWithGoogle();
      if (loginResponse!.isauthorized) {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        loginErrorMsg = loginResponse.message;
        emit(state.copyWith(status: LoginStatus.error));
      }
    } catch (_) {
      loginErrorMsg = 'Check Internet Connection!';
      emit(state.copyWith(status: LoginStatus.error));
    }
  }
}
