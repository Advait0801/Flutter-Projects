import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color colour;
  final String buttonTitle;
  final VoidCallback onPress;

  RoundedButton({required this.buttonTitle, required this.colour, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonTitle,
            style: const TextStyle(
              color: Colors.white
            ),
          )
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {

  final String text;
  final String sender;
  final bool isMe;
  final Timestamp time;

  MessageBubble({required this.text , required this.sender , required this.isMe , required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
              topLeft: isMe ? Radius.circular(30.0) : Radius.circular(0),
              topRight: isMe ? Radius.circular(0) : Radius.circular(30.0)
            ),
            color: isMe ?  Colors.lightBlueAccent : Colors.white,
            elevation: 5.0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10.0),
              child: Text(
                '$text',
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.black54
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

