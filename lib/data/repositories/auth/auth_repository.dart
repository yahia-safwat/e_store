import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/login_response.dart';
import '../../models/models.dart';
import '../repositories.dart';
import 'base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final UserRepository _userRepository;

  AuthRepository({
    auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    required UserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ??
            GoogleSignIn.standard(
              scopes: ['email'],
            ),
        _userRepository = userRepository;

  @override
  Future<auth.User?> signUp({
    required String password,
    required User user,
  }) async {
    try {
      _firebaseAuth
          .createUserWithEmailAndPassword(
        email: user.email,
        password: password,
      )
          .then((value) {
        _userRepository.createUser(
          user.copyWith(id: value.user!.uid),
        );
      });
    } catch (_) {}
    return null;
  }

  @override
  Future<LoginResponse?> logInWithGoogle() async {
    LoginResponse? loginResponse;

    try {
      late final auth.AuthCredential credential;

      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      _firebaseAuth.signInWithCredential(credential).then(
        (value) {
          _userRepository.createUser(
            User(
              id: value.user!.uid,
              fullName: value.user!.displayName ?? '',
              email: value.user!.email ?? '',
            ),
          );
        },
      );
      loginResponse = LoginResponse(isauthorized: true, message: '');
    } catch (_) {
      loginResponse = LoginResponse(isauthorized: false, message: 'Error!!');
    }

    return loginResponse;
  }

  @override
  Future<LoginResponse?> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    LoginResponse? loginResponse;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      loginResponse = LoginResponse(isauthorized: true, message: '');
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        loginResponse = LoginResponse(
            isauthorized: false, message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        loginResponse = LoginResponse(
            isauthorized: false,
            message: 'Wrong password provided for that user.');
      }
    } catch (_) {}
    return loginResponse;
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
