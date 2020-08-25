import 'package:flutter/material.dart';
import 'input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          sliderTheme: SliderThemeData(
            thumbColor: Colors.green[900],
            inactiveTrackColor: Colors.white,
            activeTrackColor: Colors.green,
          ),
          primaryColor: Color( 0xff12153b),
          scaffoldBackgroundColor : Color(0xff1e1d1d),
          textTheme: TextTheme(body1: TextStyle(
              color: Colors.white
          ),
          )
      ),
      home: InputPage(),
    );
  }
}

