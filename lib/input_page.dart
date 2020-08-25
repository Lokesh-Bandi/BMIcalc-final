import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'constants.dart';
import 'results.dart';
import 'CalcBrain.dart';
enum GenderType {
  male,
  female
}

GenderType selectedGender;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  int height=180;
  int weight=60;
  int age=18;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Reuseablecard(
                        colour: (selectedGender==GenderType.male)?inactiveColor:cardColor,
                        childWidget: Gender(FontAwesomeIcons.mars,"Male"),
                        onPress: (){
                          setState(() {
                            selectedGender=GenderType.male;
                          });
                        }
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Reuseablecard(
                          colour:(selectedGender==GenderType.female)?inactiveColor:cardColor,
                          childWidget:Gender(FontAwesomeIcons.venus,"Female"),
                          onPress: (){
                            setState(() {
                              selectedGender=GenderType.female;
                            });
                          }
                      )
                  )
                ],
              ),
            ),
            Expanded(
                child: Reuseablecard(
                    colour: cardColor,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "HEIGHT",
                        style: labelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: numberStyle,
                          ),
                          Text(
                            "cm",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                      Slider(
                          value: height.toDouble() ,
                          min: 120,
                          max: 220,
                          onChanged: (double newValue){
                            setState(() {
                              height=newValue.round();
                            });
                          }
                      )
                    ],
                  ),
                      )
            ),
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Reuseablecard(
                            colour: cardColor,
                            childWidget: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "WEIGHT",
                                  style: labelStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: numberStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ControlButton(
                                        iconfig: FontAwesomeIcons.minus,
                                        onClick: (){
                                          setState(() {
                                            weight--;
                                          });
                                        },
                                    ),
                                    ControlButton(
                                      iconfig: FontAwesomeIcons.plus,
                                      onClick: (){
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: Reuseablecard(
                            colour: cardColor,
                          childWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "AGE",
                                style: labelStyle,
                              ),
                              Text(
                                age.toString(),
                                style: numberStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ControlButton(
                                    iconfig: FontAwesomeIcons.minus,
                                    onClick: (){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  ControlButton(
                                    iconfig: FontAwesomeIcons.plus,
                                    onClick: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                    )
                  ],
                )
            ),
            GestureDetector(
              onTap: () {
                CalcBrain bodyTheme= CalcBrain(height: height,weight: weight);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>ResultsPage(
                        bmi: bodyTheme.bmiCalc(),
                        feedBack: bodyTheme.feedBack(),
                        feedBackDesc: bodyTheme.feedBackDesc(),
                      )
                    )
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        "CALCULATE",
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
        )
    );
  }
}

class ControlButton extends StatelessWidget {
  IconData iconfig;
  Function onClick;
  ControlButton({this.iconfig,this.onClick});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick,
      child: Icon(
          iconfig,
          color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}


