abstract class LoginState {}

class LoggedIn extends LoginState {
  String email;
  LoggedIn(this.email);
}

class LoggedOut extends LoginState {}
