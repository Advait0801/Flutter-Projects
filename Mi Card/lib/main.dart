import 'package:flutter/material.dart';

void main(){
  runApp(
  MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Mi Card"),
        ),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.0,
                color: Colors.red,
              ),
              Center(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.yellow,

                ),
              ),
              Container(
                width: 100.0,
                color: Colors.blue,
              )

            ],
          ),
        ),
      ),
    );
  }
}
