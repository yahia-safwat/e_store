import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../data/models/models.dart';
import '../../../data/repositories/repositories.dart';
import '../blocs.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  // final CartBloc _cartBloc;

  final UserRepository _userRepository;

  StreamSubscription? _authSubscription;
  // StreamSubscription? _cartSubscription;

  ProfileBloc({
    required AuthBloc authBloc,
    // required CartBloc cartBloc,
    required UserRepository userRepository,
  })  : _authBloc = authBloc,
        // _cartBloc = cartBloc,
        _userRepository = userRepository,
        super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.user is AuthUserChanged) {
        if (state.user != null) {
          add(LoadProfile(authUser: state.authUser));
        }
      }
    });

    // _cartSubscription = _cartBloc.stream.listen(
    //   (state) {
    //     if (state is CartLoaded) {
    //       if (_authBloc.state.user != null) {
    //         add(UpdateProfile(
    //           user: _authBloc.state.user!,
    //           cart: state.cart,
    //         ));
    //       }
    //     }
    //   },
    // );
  }

  void _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) {
    if (event.authUser != null) {
      _userRepository.getUser(event.authUser!.uid).listen((user) {
        add(
          UpdateProfile(user: user),
        );
      });
    } else {
      emit(ProfileUnauthenticated());
    }
  }

  void _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) {
    _userRepository.updateUser(event.user);
    emit(ProfileLoaded(user: event.user));
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    // _cartSubscription?.cancel();
    super.close();
  }
}
