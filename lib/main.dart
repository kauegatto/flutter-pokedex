import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_list.dart';
import './screens/home.dart';
import './screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        colorScheme:
            const ColorScheme.dark(primary: Color.fromRGBO(228, 0, 15, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'UNICAMP Pokedex'),
    );
  }
}

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
        title: Text(widget.title),
      ),
      body: IndexedStack(
          index: _currentPage,
          children: [LoginForm(), const PokedexHome(), PokedexScreen()]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Liked"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "List")
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
