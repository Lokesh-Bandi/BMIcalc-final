import 'package:flutter/material.dart';
import 'constants.dart';
class Gender extends StatelessWidget {
  IconData gen;
  String label;
  Gender(IconData a,String b){
    gen=a;
    label=b;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          gen,
          size :90,
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: labelStyle
        )
      ],
    );
  }
}

