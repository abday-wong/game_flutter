import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<GameScreen> {
  final ValueNotifier<int> Counter = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        
        const Positioned.fill(
          child: ColoredBox(color: Color.fromARGB(255, 234, 236, 237)),
        ),

          
        Positioned(
          top: 50,
          left: 20,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ValueListenableBuilder<int>(
              valueListenable: Counter,
              builder: (context, score, _) {
                return Text(
                  'Score: $score',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
        ),

  
        Positioned(
          top: 50,
          right: 20,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.music_note, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.volume_up, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
        ),

        
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Counter.value++;
              },
              child: const Text("Tambah Score"),
            ),
          ),
        ),
      ],
    ),
  );
}
}

              