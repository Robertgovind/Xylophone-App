import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void playSound(int audioNumber) {
    AudioPlayer player = AudioPlayer();
    player.setVolume(1);
    player.play(AssetSource('note$audioNumber.wav'));
  }

  Widget painoKey(int number, Color col) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            enableFeedback: false,
            backgroundColor: MaterialStateProperty.all(col)),
        onPressed: () {
          setState(() {
            playSound(number);
          });
        },
        child: Container(
          height: 60,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Xylophone App"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              painoKey(1, Colors.amber),
              painoKey(2, Colors.blue),
              painoKey(3, Colors.green),
              painoKey(4, Colors.red),
              painoKey(5, Colors.orange),
              painoKey(6, Colors.purple),
              painoKey(7, Colors.pink),
            ],
          ),
        ),
      ),
    );
  }
}
