import 'package:flutter/material.dart';
import 'constants.dart';

class ButtomBotton extends StatelessWidget {
  ButtomBotton({@required this.textLable, @required this.onPress});

  // final int age;
  // final Gender selectGender;
  final String textLable;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: (){
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(age: age,gender: selectGender,)));
      // },
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            textLable.toUpperCase(),
            style: calcuTextStyle,
          ),
        ),
        color: bottomcolor,
        width: double.infinity,
        height: 60,
      ),
    );
  }
}
