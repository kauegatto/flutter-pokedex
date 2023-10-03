import 'package:bloc/bloc.dart';
import 'package:pokedex/logic/login/login_event.dart';
import 'package:pokedex/logic/login/login_state.dart';

class LoginBloc extends Bloc<LogInEvent, LoginState> {
  LoginBloc() : super(LoggedOut()) {
    on<LoginUserEvent>((event, emit) {
      if (event.email == "teste" && event.password == "123456") {
        emit(LoggedIn(event.email));
      }
    });
    on<LogoutUserEvent>((event, emit) {
      LoggedOut();
    });
  }
}
