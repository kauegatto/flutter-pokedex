abstract class LogInEvent {}

class LoginUserEvent extends LogInEvent {
  String email;
  String password;
  LoginUserEvent(this.email, this.password);
}

class LogoutUserEvent extends LogInEvent {}
