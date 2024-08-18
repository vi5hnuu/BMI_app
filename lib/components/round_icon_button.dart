import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onpress;
  const RoundIconButton({Key? key, required this.icon,required this.onpress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4FE),
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0
      ),
      child: Icon(icon),
    );
  }
}