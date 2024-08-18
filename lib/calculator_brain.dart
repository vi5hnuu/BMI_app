import 'dart:math';

class UserBmi{
  final int height;
  final int weight;
  UserBmi({required this.height,required this.weight}):assert(height>0),assert(weight>0);

  double get bmi{
    return weight/pow(height/100, 2);
  }

  String getInterpretation({double? bmi}){
    if(bmi==null) return "Please check the input data.";
    if(bmi>=25)
      return "You have a higher than normal body weight.Try to exercise more.";
    else if(bmi>=18.5)
      return "You have a normal body weight.\nGood job";
    else
      return "You have a lower than normal body weight.\nYou can eat a bit more.";
  }

  String getWeightInterpretation({double? bmi}){
    if(bmi==null) return "unknown";
    if(bmi>=25)
      return "Overweight";
    else if(bmi!>=18.5)
      return "Normal";
    else
      return "Underweight";
  }
}