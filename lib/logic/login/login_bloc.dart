import 'package:bloc/bloc.dart';
import 'package:flutter_dex/logic/login/login_event.dart';
import 'package:flutter_dex/logic/login/login_state.dart';
import 'package:flutter_dex/provider/firebase_auth.dart';

class LoginBloc extends Bloc<LogInEvent, LoginState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();

  LoginBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      add(LogInServerEvent(event));
    });

    on<LogInServerEvent>((event, emit) {
      if (event.userModel == null) {
        emit(Unauthenticated());
      } else {
        emit(Authenticated(userModel: event.userModel!));
      }
    });

    on<RegisterUser>((event, emit) async {
      try {
        await _authenticationService.createUserWithEmailAndPassword(
            event.email, event.password);
      } catch (e) {
        emit(LoginError(msg: "Impossível registrar-se: ${e.toString()}"));
      }
    });

    on<LoginUser>((event, emit) async {
      try {
        await _authenticationService.signInWithEmailAndPassword(
            event.username, event.password);
      } catch (e) {
        emit(LoginError(
            msg: "Impossível logar-se com ${event.username}: ${e.toString()}"));
      }
    });

    on<LoginAnonymousUser>((event, emit) async {
      try {
        await _authenticationService.signInAnonimo();
      } catch (e) {
        emit(LoginError(
            msg: "Impossível acessar anonimamente: ${e.toString()}"));
      }
    });

    on<Logout>((event, emit) async {
      try {
        await _authenticationService.signOut();
      } catch (e) {
        emit(LoginError(msg: "Impossivel efetuar logout: ${e.toString()}"));
      }
    });
  }
}
