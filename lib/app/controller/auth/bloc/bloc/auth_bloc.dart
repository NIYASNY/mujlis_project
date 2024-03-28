import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial());

  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is SignInEvent) {
      yield* _mapSignInEventToState(event.email, event.password);
    } else if (event is RegisterEvent) {
      yield* _mapRegisterEventToState(event.email, event.password);
    } else if (event is SignOutEvent) {
      yield AuthLoading();
      try {
        await _firebaseAuth.signOut();
        yield AuthSignedOut();
      } catch (e) {
        yield AuthError(e.toString());
      }
    }
  }

  Stream<AuthState> _mapSignInEventToState(String email, String password) async* {
    yield AuthLoading();
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      yield AuthAuthenticated();
    } catch (e) {
      yield AuthError(e.toString());
    }
  }

  Stream<AuthState> _mapRegisterEventToState(String email, String password) async* {
    yield AuthLoading();
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      yield AuthRegistered();
    } catch (e) {
      yield AuthError(e.toString());
    }
  }
}
