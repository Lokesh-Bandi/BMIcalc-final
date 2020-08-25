import 'package:flutter/material.dart';
class Reuseablecard extends StatelessWidget {
  Color colour;
  Widget childWidget;
  Function onPress;
  Reuseablecard ({ this.colour ,this.childWidget , this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childWidget,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}