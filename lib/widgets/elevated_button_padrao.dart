import 'package:flutter/material.dart';

class ElevatedButtonPadrao {
  static ButtonStyle getEstilo({
    Color backgroundColor = Colors.red,
    Color foregroundColor = Colors.white,
  }) {
    return ElevatedButton.styleFrom(
        foregroundColor: foregroundColor, backgroundColor: backgroundColor);
  }

  static ButtonStyle getEstiloComTamanho(double width, double height) {
    ButtonStyle estilo = getEstilo();
    estilo = estilo.copyWith(
      fixedSize: MaterialStateProperty.all<Size>(Size(width, height)),
    );
    return estilo;
  }
}
