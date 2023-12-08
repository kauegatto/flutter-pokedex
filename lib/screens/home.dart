import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/logic/like/like_event.dart';
import 'package:flutter_dex/screens/liked_pokemon.dart';
import 'package:flutter_dex/screens/pokemon_list.dart';
import '../logic/like/like_bloc.dart';
import '../logic/login/login_bloc.dart';
import '../logic/login/login_state.dart';
import 'info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, loginState) {
        final uuid =
            (loginState is Authenticated) ? loginState.userModel.uuid : null;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Pokemon',
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
          ),
          body: MultiBlocProvider(
            providers: [
              BlocProvider<LikeBloc>(
                create: (context) => LikeBloc(uuid: uuid),
              ),
            ],
            child: IndexedStack(
              index: _currentPage,
              children: const [
                PokedexInfo(),
                PokedexScreen(),
                LikedPokemonScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.redAccent,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Início"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list), label: "Pokemons"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Curtidos"),
            ],
            currentIndex: _currentPage,
            onTap: (int tappedIndex) {
              setState(() {
                _currentPage = tappedIndex;

                // if (_currentPage == 2) {
                //   BlocProvider.of<LikeBloc>(context).add(FindLikedEvent(uuid));
                // }
              });
            },
          ),
        );
      },
    );
  }
}