import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiText;
  final String interpretation;

  ResultPage({required this.bmiResult, required this.bmiText, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result' , style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(bmiText.toUpperCase() , style: kResultTextStyle),
                  Text(bmiResult , style: kBMITextStyle),
                  Text(interpretation , style: kBodyTextStyle, textAlign: TextAlign.center,)
                ],
              ),
            )
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              child: Center(child: Text('RECALCULATE' , style: kLargeButtonStyle,)),
              color: kBottomContainerColour,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
            ),
          )
        ],
      ),
    );
  }
}
