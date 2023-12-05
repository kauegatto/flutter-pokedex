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
