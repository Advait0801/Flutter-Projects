import 'package:flutter/material.dart';
import 'dart:math';

void main(){
  runApp(
    const MaterialApp(
      home: BallPage(),
    )
  );
}

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ask Me Anything"),
        backgroundColor: Colors.blue[900],
      ),
      body: const Ball()
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  var ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: TextButton(
        child: Center(child: Image.asset('images/ball$ballNumber.png')),
        onPressed: (){
          setState(() {
            ballNumber = Random().nextInt(4) + 1;
          });
        }
      ),
    );
  }
}


