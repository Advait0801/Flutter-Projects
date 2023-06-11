import 'dart:math';

class Calculator{
  final int userHeight;
  final int userWeight;
  late double _bmi;

  Calculator({required this.userHeight , required this.userWeight});

  String calculateBMI(){
    _bmi = userWeight / pow(userHeight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }
    else if(_bmi >= 18.5){
      return 'Normal';
    }
    else{
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(_bmi >= 25){
      return 'You have a higher than normal body weight. Try exercising more!';
    }
    else if(_bmi >= 18.5){
      return 'You have a normal body weight. GOOD JOB!!';
    }
    else{
      return 'You have a lesser than normal body weight. Eat more food!';
    }
  }
}