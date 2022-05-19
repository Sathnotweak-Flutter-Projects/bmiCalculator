import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({@required this.icon, @required this.func});
  final IconData? icon;
  final VoidCallback? func;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: func,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}
