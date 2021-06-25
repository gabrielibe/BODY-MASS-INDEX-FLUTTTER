import 'package:bmi_calc/bmiBrain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'BuildBox.dart';
import 'ColumnBuild.dart';
import 'constants.dart';
import 'buildBmi_page.dart';

//created an enum for the color selector of the mal and female cards
enum gender {
  male,
  female,
}

//gender selector is used with the enum and tenery operator to psecify which gender was picked so that
//the clicked one will have an active color and any previosly active one will be deactivated.the same thing can be
//implemented for other buttons
gender GenderSelector;

//constants to make editing easier
Color male = kInactivecolor;
Color female = kInactivecolor;

//integers that change values cos of the icons down below
int height = 180;
int weight = 68;
int age = 23;
String verdict='verdict';
String advice='advice';
int BMIN=1;
//0xff1d1e33

CalcBa cock=CalcBa(height:height, Weight:weight,Age: age);



class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:
                      /*Buildbox class created here.takes arguements like colort for color or cardchild as the class child of the build box
                  * the buildbox also takes a function argement opressed.the reason the function couldnt be coded into the class is that
                  * it needded set state and setstate wasnt allolwed in a stateless widget.converint the class to statefull made me run into problems**/

                      buildbox(
                    colort: GenderSelector == gender.female
                        ? KActivecolor
                        : kInactivecolor,
                    cardchild: childCol(
                      Ico: FontAwesomeIcons.venus,
                      pm: 'FEMALE',
                    ),
                    gest: () {
                      setState(() {
                        GenderSelector = gender.female;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: buildbox(
                      colort: //tenery operator here that takes changees color depending on the
                          //the selelcted gender which is changes on pressed of the button.
                          GenderSelector == gender.male
                              ? KActivecolor
                              : kInactivecolor,
                      cardchild: childCol(
                        Ico: FontAwesomeIcons.mars,
                        pm: 'MALE',
                      ),
                      gest: () {
                        setState(() {
                          GenderSelector = gender.male;
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
              child: buildbox(
            colort: kInactivecolor,
            cardchild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: KNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: KLabelTextStyle,
                    )
                  ],
                ),

                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xffeb1555),
                    overlayColor: Color(0x29eb1555),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 180,
                    max: 250,
                    //activeColor: Kbottonbarcol,
                    // inactiveColor: KActivecolor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                )
                //onChanged: (){})
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: buildbox(
                  colort: kInactivecolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age', style: KLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(weight.toString(), style: KNumberTextStyle),
                          Text('KG', style: KLabelTextStyle)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            Barry: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            Barry: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: buildbox(
                  colort: kInactivecolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: KLabelTextStyle),
                      Text(age.toString(), style: KNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            Barry: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            Barry: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BMI();
              }));
                BMIN = cock.calcbmi();
                verdict = cock.retverdict();
                advice =  cock.retadvice();
            },
            child: Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(top: 15),
              color: Kbottonbarcol,
              child: Center(
                child: Text('calculate your bmi here',
                    style: TextStyle(
                      fontSize: 30,
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData Barry;
  final Function onPressed;
  RoundIconButton({this.Barry, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints(minWidth: 50.0, minHeight: 50.0),
      fillColor: KActivecolor,
      shape: CircleBorder(),
      child: Icon(Barry),
    );
  }
}
