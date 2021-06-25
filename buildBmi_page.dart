import 'package:bmi_calc/BuildBox.dart';
import 'package:bmi_calc/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(BMI());

class BMI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Text(
                  'RESULTS',
                  style: KNumberTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  flex: 5,
                  child: buildbox(
                    colort: KActivecolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          verdict,
                          style: TextStyle(color: Colors.green,
                          fontWeight: FontWeight.bold),
                        ),
                        Text(BMIN.toStringAsFixed(2),
                          style: TextStyle(
                              fontSize: 80, fontWeight: FontWeight.w900),
                        ),
                        Text(advice,)
                      ],
                    ),
                  )),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.only(top: 15),
                    color: Kbottonbarcol,
                    child: Center(
                      child: Text('Recalculate your BMI',
                          style: TextStyle(
                            fontSize: 30,
                          )),
                    ),
                  ),
                ),
              ),
            ]));
  }
}
