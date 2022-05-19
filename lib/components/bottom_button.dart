import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({this.txt, this.nav});
  final String? txt;
  final VoidCallback? nav;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nav,
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        child: Center(
          child: Text(
            txt!,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        margin: const EdgeInsets.only(top: 10.0),
        height: 80.0,
        width: double.infinity,
        color: kSubmitColor,
      ),
    );
  }
}
