import 'package:bmi/components/bottom_button.dart';
import 'package:flutter/material.dart';

import '../components/reuseablecard.dart';
import '../constants.dart';

class ResultPAge extends StatelessWidget {
  const ResultPAge(
      {@required this.result, @required this.bmi, @required this.sug});
  final String? result;
  final String? bmi;
  final String? sug;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              child: Text('Your Result',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900)),
            ),
            Expanded(
                flex: 5,
                child: ReuseableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(result!,
                          style: kResultText, textAlign: TextAlign.center),
                      Text(bmi!, style: kBMIValue, textAlign: TextAlign.center),
                      Text(
                        sug!,
                        style: kSuggestion,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )),
            BottomButton(
              txt: 'RE-CALCULATE',
              nav: () {
                Navigator.pop(context);
              },
            )
          ],
        ));
  }
}
