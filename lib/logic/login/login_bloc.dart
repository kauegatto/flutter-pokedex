import 'package:bloc/bloc.dart';
import 'package:pokedex/logic/login/login_event.dart';
import 'package:pokedex/logic/login/login_state.dart';

class LoginBloc extends Bloc<LogInEvent, LoginState> {
  LoginBloc() : super(LoggedOut()) {
    on<LoginUserEvent>((event, emit) {
      if (event.email == "teste" && event.password == "123456") {
        print("logged");
        emit(LoggedIn(event.email));
      }
      print("exited with ${event.email} ${event.password}");
    });
    on<LogoutUserEvent>((event, emit) {
      LoggedOut();
    });
  }
}
