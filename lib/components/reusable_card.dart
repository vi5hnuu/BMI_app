import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final VoidCallback onpress;
  const ReusableCard({Key? key, required this.color,required this.onpress,this.cardChild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: color,
            borderRadius:BorderRadius.circular(10.0)
        ),
        child: cardChild,
      ),
    );
  }
}

