<<<<<<< HEAD
abstract class LogInEvent {}

class LoginUserEvent extends LogInEvent {
  String email;
  String password;
  LoginUserEvent(this.email, this.password);
}

class LogoutUserEvent extends LogInEvent {}
=======
import 'package:flutter_dex/model/user_model.dart';

abstract class LogInEvent {}

class RegisterUser extends LogInEvent {

  String email;
  String password;

  RegisterUser({required this.email, required this.password});
}

class LoginUser extends LogInEvent {
  String username;
  String password;

  LoginUser({required this.username, required this.password});
}

class LoginAnonymousUser extends LogInEvent {}

class Logout extends LogInEvent {}

class LogInServerEvent extends LogInEvent {
  final UserModel? userModel;
  LogInServerEvent(this.userModel);
}

>>>>>>> 19fa8a2 (Firebase)
