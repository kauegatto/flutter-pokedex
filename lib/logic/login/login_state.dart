<<<<<<< HEAD
abstract class LoginState {}

class LoggedIn extends LoginState {
  String email;
  LoggedIn(this.email);
}

class LoggedOut extends LoginState {}
=======
import 'package:flutter_dex/model/user_model.dart';

abstract class LoginState {}

class Unauthenticated extends LoginState {}

class Authenticated extends LoginState {
  UserModel userModel;
  Authenticated({required this.userModel});
}

class LoginError extends LoginState {
  final String msg;

  LoginError({required this.msg});
}
>>>>>>> 19fa8a2 (Firebase)
