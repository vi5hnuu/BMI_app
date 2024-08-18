
import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  const BottomButton({Key? key, required this.buttonTitle,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: const EdgeInsets.symmetric(horizontal: 110.0,vertical: 10.0),
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text(buttonTitle, style: kLargeButtonTextStyle),
      ),
    );
  }
}
