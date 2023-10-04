import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/logic/login/login_bloc.dart';
import 'package:pokedex/screens/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(primary: Color(0xFFE4000F)),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => LoginBloc(),
          child: const Wrapper(),
        ));
  }
}
