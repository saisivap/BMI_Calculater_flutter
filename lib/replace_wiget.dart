import 'package:flutter/material.dart';

class Replace extends StatelessWidget {
  final Color colour;
  final Widget childOfWidget;
  final Function onpress;
  Replace({@required this.colour, this.childOfWidget,this.onpress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onpress ,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: childOfWidget,
        ),
      ),
    );
  }
}
