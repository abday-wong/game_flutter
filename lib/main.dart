import 'package:flutter/material.dart';
import 'package:game_fruit_catcher/game/gamescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Fruit Catcher Game', home: const Gamescreen());
  }
}