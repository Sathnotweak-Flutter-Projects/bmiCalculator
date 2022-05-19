import 'package:bmi/calculator_brain.dart';
import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/reuseablecard.dart';
import 'package:bmi/components/round_button.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'results_page.dart';

enum Gender { male, female }
Gender? selectedGender;
int height = 160;
int weight = 60;
int age = 18;

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: Row(children: [
            Expanded(
                child: ReuseableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.male;
                });
              },
              colour: selectedGender == Gender.male
                  ? kActiveCardColor
                  : kInactiveCardColor,
              cardChild: cardContent(
                ico: FontAwesomeIcons.mars,
                txt: 'Male',
              ),
            )),
            Expanded(
                child: ReuseableCard(
              onPress: () {
                setState(() {
                  selectedGender = Gender.female;
                });
              },
              colour: selectedGender == Gender.female
                  ? kActiveCardColor
                  : kInactiveCardColor,
              cardChild: cardContent(
                ico: FontAwesomeIcons.venus,
                txt: 'Female',
              ),
            ))
          ])),
          Expanded(
              child: ReuseableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberText,
                    ),
                    const Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0xFFEB1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30),
                        activeTrackColor: Colors.white,
                        overlayColor: const Color(0x29Eb1555),
                        inactiveTickMarkColor: const Color(0xFF8D8E98)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 200,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )),
              ],
            ),
          )),
          Expanded(
              child: Row(children: [
            Expanded(
                child: ReuseableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'WEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    weight.toString(),
                    style: kNumberText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButton(
                        icon: FontAwesomeIcons.minus,
                        func: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RoundButton(
                        icon: FontAwesomeIcons.plus,
                        func: () {
                          setState(() {
                            weight++;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              colour: kActiveCardColor,
            )),
            Expanded(
                child: ReuseableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'AGE',
                    style: kLabelTextStyle,
                  ),
                  Text(
                    age.toString(),
                    style: kNumberText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundButton(
                        icon: FontAwesomeIcons.minus,
                        func: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RoundButton(
                        icon: FontAwesomeIcons.plus,
                        func: () {
                          setState(() {
                            age++;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
              colour: kActiveCardColor,
            ))
          ])),
          BottomButton(
            txt: 'CALCULATE',
            nav: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPAge(
                    result: calc.getResult(),
                    bmi: calc.calculateBMI(),
                    sug: calc.getInterpretation());
              }));
            },
          )
        ]));
  }
}
