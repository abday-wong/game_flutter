import 'package:flutter/material.dart';
import 'package:game_fruit_catcher/game/gamescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Fruit Catcher Game', home: const GameScreen());
  }
}

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Game akan ditampilkan disini'),
      ),
    );
  }
}