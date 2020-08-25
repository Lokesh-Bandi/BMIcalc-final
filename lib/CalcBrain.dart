import 'dart:math';
class CalcBrain {

  CalcBrain( {this.height,this.weight});
  int height;
  int weight;
  double bmi=0;
  String bmiCalc(){
    bmi= ((weight/pow(height/100,2)));
    return bmi.toStringAsFixed(1);
  }
  String feedBack(){
    if(bmi >= 25){
      return ("OverWeight");
    }
    else if(bmi>18){
      return ("Normal");
    }
    else{
      return ("UnderWeight");
    }
  }
  String feedBackDesc(){
    if(bmi >= 25){
      return ("You have a higher than normal body weight. Try to exercise daily!");
    }
    else if(bmi>18){
      return ("You have a normal body weight. Good job!");
    }
    else{
      return ("You have lower than normal body weight. You should eat daily!");
    }
  }
}