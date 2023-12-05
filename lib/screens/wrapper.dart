import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/logic/login/login_bloc.dart';
import 'package:flutter_dex/logic/login/login_state.dart';
import 'package:flutter_dex/screens/home.dart';
import 'package:flutter_dex/screens/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is Authenticated) {
            return const MyHomePage(title: "UNICAMP Pokédex");
          } else {
            return LoginForm();
          }
        },
      ),
    );
  }
}
