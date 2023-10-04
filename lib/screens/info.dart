import 'package:flutter/material.dart';
import 'package:pokedex/widgets/elevated_button_padrao.dart';
import 'package:pokedex/widgets/flutterdex_logo.dart';

class PokedexInfo extends StatelessWidget {
  const PokedexInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            const FlutterdexLogo(),
            const SizedBox(height: 50),
            const Text("FlutterDex!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 235, 66, 44),
                  letterSpacing: 3, // Default is one
                )),
            const Text(
              "A sua pokédex, mas em flutter",
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 255, 255, 255),
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButtonPadrao.getEstilo(),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("O que é esse app?"),
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              "Este é o FlutterDex, a pokedéx virtual feita em flutter. "
                              "Uma Pokédex é uma enciclopédia de Pokémon. "
                              "Neste aplicativo, você pode explorar informações sobre diferentes Pokémon, "
                              "ver suas imagens, tipos, curiosidades, et cetera."),
                          SizedBox(height: 20),
                          Text("Feito por Kauê Gatto e Vinicius Costa")
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("O que é esse app"),
            )
          ],
        ),
      ),
    );
  }
}
