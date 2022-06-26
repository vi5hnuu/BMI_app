import 'dart:math';

class CalculatorBrain{
  final int height;
  final int weight;
  double? _bmi;
  CalculatorBrain({required this.height,required this.weight});

  String calculateBMI(){
    double bmi=weight/pow(height/100, 2);
    _bmi=bmi;
    return bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi!=null){
      if(_bmi!>=25)
        return "Overweight";
      else if(_bmi!>=18.5)
        return "Normal";
      else
        return "Underweight";
    }
    else{
      return "Unknown";
    }
  }

  String getIntrepretation(){
    if(_bmi!=null){
      if(_bmi!>=25)
        return "You have a higher than normal body weight.Try to exercise more.";
      else if(_bmi!>=18.5)
        return "You have a normal body weight.\nGood job";
      else
        return "You have a lower than normal body weight.\nYou can eat a bit more.";
    }else{
      return "Please check the input data.";
    }
  }
}