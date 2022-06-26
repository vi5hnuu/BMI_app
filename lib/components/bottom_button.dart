
import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  BottomButton({required this.buttonTitle,required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(
          this.buttonTitle,
          style: kLargeButtonTextStyle,
        ),
        alignment: Alignment.center,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.symmetric(horizontal: 110.0,vertical: 10.0),
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      onTap: this.onTap,
    );
  }
}
