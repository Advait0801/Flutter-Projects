import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  Expanded brick(MaterialStateProperty<Color> color,int sound){
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
            backgroundColor: color
        ),
        onPressed: () {
          final player = AudioPlayer();
          player.play('note$sound.wav');
        }, child: const Text(""),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              brick(MaterialStateProperty.all<Color>(Colors.red), 1),
              brick(MaterialStateProperty.all<Color>(Colors.orange), 2),
              brick(MaterialStateProperty.all<Color>(Colors.yellow), 3),
              brick(MaterialStateProperty.all<Color>(Colors.green), 4),
              brick(MaterialStateProperty.all<Color>(Colors.blue), 5),
              brick(MaterialStateProperty.all<Color>(Colors.indigo), 6),
              brick(MaterialStateProperty.all<Color>(Colors.purple), 7)
            ],
          ),
        ),
      ),
    );
  }
}
