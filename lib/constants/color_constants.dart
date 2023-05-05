import 'package:flutter/material.dart';

// Цвет кнопки "Запросить ещё раз"
const gradientColor = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color.fromRGBO(124, 98, 255, 1), Color.fromRGBO(186, 98, 255, 1)],
);

// Цвет текста с указаниями, последних цифр и кнопки "стереть"
const taskColor = Color.fromRGBO(123, 97, 255, 1);

// Градиент на первом экране
const homePageGradient = LinearGradient(
  colors: [
    Colors.blue,
    Colors.purple,
    Colors.red,
  ],
);
