import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_list.dart';
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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title,
              style: const TextStyle(
                  fontFamily: 'Pokemon',
                  color: Colors.white,
                  letterSpacing: 2.0))),
      body: IndexedStack(index: _currentPage, children: [
        const PokedexInfo(),
        PokedexScreen(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Início"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Pokemons"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Curtidos"),
        ],
        currentIndex: _currentPage,
        onTap: (int tappedIndex) {
          setState(() {
            _currentPage = tappedIndex;
          });
        },
      ),
    );
  }
}
