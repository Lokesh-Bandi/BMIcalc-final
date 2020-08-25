import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reuseable_card.dart';
class ResultsPage extends StatelessWidget {
  String feedBack;
  String feedBackDesc;
  String bmi;
  ResultsPage({@required this.bmi,@required this.feedBack,@required this.feedBackDesc});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RESULT"),
        backgroundColor: Colors.blue ,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            )
          ),
          Expanded(
            flex: 5,
            child: Reuseablecard(
              colour: cardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    feedBack,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    feedBackDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic
                    ),
                  )
                ],
              )
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      "RECALCULATE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  height: 70,
                  color: Colors.red[500],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
