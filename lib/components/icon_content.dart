import 'package:flutter/material.dart';

import '../constants.dart';

class cardContent extends StatelessWidget {
  cardContent({required this.ico, required this.txt});
  final IconData ico;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        ico,
        size: 80.0,
      ),
      const SizedBox(height: 15.0),
      Text(
        txt,
        style: kLabelTextStyle,
      )
    ]);
  }
}
