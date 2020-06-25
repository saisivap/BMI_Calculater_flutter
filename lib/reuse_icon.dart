import 'package:flutter/material.dart';
import 'constants.dart';
class ReuseIcon extends StatelessWidget {
  final IconData nameOfIcon;
  final String nameToPlace;
  ReuseIcon({this.nameOfIcon, this.nameToPlace});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          nameOfIcon,
          size: 80,
        ),
        SizedBox(height: 10.0),
        Text(
          nameToPlace,
          style: normalNameTextStyle,
        )
      ],
    );
  }
}
