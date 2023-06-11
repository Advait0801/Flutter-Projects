import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
   final Color colour;
   final Widget cardChild;

   ReusableCard({required this.colour , required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final IconData icon;
  final String label;

  CardContent({required this.icon , required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(
          label,
          style: kLabelTextStyle
        )
      ],
    );
  }
}
