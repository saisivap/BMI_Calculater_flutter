// import 'dart:html';

import 'package:bmi_calculator/calResult.dart';
import 'package:bmi_calculator/result_bmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuse_icon.dart';
import 'replace_wiget.dart';
import 'constants.dart';
import 'bottombutton.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  // Color malecard = inactivecolor;
  // Color femalecard = inactivecolor;
  Gender selectGender;
  int height = 180;
  int weight = 70;
  int age = 21;
  // void updateColor(Gender selectedGender) {
  //   //MaleCard Background
  //   if (selectedGender == Gender.male) {
  //     if (malecard == inactivecolor) {
  //       malecard = activecolor;
  //       femalecard = inactivecolor;
  //     } else {
  //       malecard = inactivecolor;
  //     }
  //   } //FemaleCard Background
  //   if (selectedGender == Gender.female) {
  //     if (femalecard == inactivecolor) {
  //       femalecard = activecolor;
  //       malecard = inactivecolor;
  //     } else {
  //       femalecard = inactivecolor;
  //     }
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Replace(
                    colour: selectGender == Gender.male
                        ? activecolor
                        : inactivecolor,
                    childOfWidget: ReuseIcon(
                      nameOfIcon: FontAwesomeIcons.mars,
                      nameToPlace: "MALE",
                    ),
                    onpress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Replace(
                    colour: selectGender == Gender.female
                        ? activecolor
                        : inactivecolor,
                    childOfWidget: ReuseIcon(
                      nameOfIcon: FontAwesomeIcons.venus,
                      nameToPlace: "FEMALE",
                    ),
                    onpress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Replace(
              colour: inactivecolor,
              childOfWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Height",
                    style: normalNameTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(height.toString(), style: headingTextStyle),
                      Text("CM", style: normalNameTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white70,
                        inactiveTrackColor: Colors.grey,
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15), //nob Size
                        thumbColor: bottomcolor, // Color of nob
                        overlayColor: Color(
                            0X28F48FB1) //used to hover the color on the thumb(nob)

                        ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      // can implement these colors in SliderTheme
                      // activeColor: Colors.white70,
                      // inactiveColor: Colors.grey,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Replace(
                    colour: inactivecolor,
                    childOfWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            "Weight",
                            style: normalNameTextStyle,
                          ),
                          Expanded(
                            child: Text(
                              weight.toString(),
                              style: headingTextStyle,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                WeightIcons(
                                  icondata: FontAwesomeIcons.plus,
                                  onpress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                SizedBox(width: 10),
                                WeightIcons(
                                  icondata: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                // FloatingActionButton(onPressed: null),
                              ],
                            ),
                          ),
                          // FloatingActionButton(onPressed: (){} ,)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Replace(
                    colour: inactivecolor,
                    childOfWidget: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Age",
                            style: normalNameTextStyle,
                          ),
                          Expanded(
                            child: Text(
                              age.toString(),
                              style: headingTextStyle,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                WeightIcons(
                                  icondata: FontAwesomeIcons.plus,
                                  onpress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                WeightIcons(
                                  icondata: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtomBotton(
              textLable: "calculate",
              onPress: () {
                CalResult cal = new CalResult(height: height,weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Result(
                      value: cal.cal(),
                      msg: cal.getResult(),
                      msgclassified: cal.message(),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     accentColor: Colors.white,
      //   ),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}

// We used RawMaterialButton to create the buttons like FlottingButtons.
// So we build a custom Widget
//
class WeightIcons extends StatelessWidget {
  final IconData icondata;
  final Function onpress;
  WeightIcons({this.icondata, this.onpress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icondata),
      onPressed: onpress,
      fillColor: Color(0XFFF48FB1),
      // Shape is used to specifiy the Shape of the button
      shape: CircleBorder(),
      // constraints are used to specifiy the height and width of a button
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
    );
  }
}
