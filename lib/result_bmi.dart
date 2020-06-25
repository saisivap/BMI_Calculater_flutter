import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottombutton.dart';

class Result extends StatelessWidget {
  Result({this.value, this.msg,this.msgclassified});
  final String msgclassified;
  final String value;
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Your Result",
            style: headingTextStyle,
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: inactivecolor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: <Widget>[
                      Text(
                        msg.toUpperCase(),
                        style: colorTextStyle,
                      ),
                      Text(
                        value,
                        style: resultTextStyle,
                      ),
                      Text(
                        msgclassified,
                        style: normalNameTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: ButtomBotton(onPress: (){
              Navigator.pop(context);
            },textLable: "re-calculate"),
          )
        ],
      ),
    );
  }
}
