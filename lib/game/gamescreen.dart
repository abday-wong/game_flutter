import 'package:flutter/material.dart';

class Gamescreen extends StatefulWidget {
  const Gamescreen({super.key});

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  final ValueNotifier<int> Counter = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Stack(
          children: [
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
                  builder: (context, score, child) {
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
            ), // ← ini yang tadi kurang
        
            Positioned(
              top: 50,
              right: 20,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.music_note, color: Colors.black),
                    onPressed: () {
                      // Handle volume up action
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {
                      // Handle volume off action
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
