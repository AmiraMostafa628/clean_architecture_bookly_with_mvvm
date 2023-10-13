import 'package:clean_architecture_bookly/core/utils/style_manager.dart';
import 'package:clean_architecture_bookly/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    required this.text,
    this.fontSize, this.onPressed}) : super(key: key);

  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s48,
      child: TextButton(
          onPressed:onPressed ,
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius:borderRadius?? BorderRadius.circular(AppSize.s12)
              )
          ),
          child: Text(text,
            style: Styles.testStyle18.copyWith(
                color: textColor,
                fontWeight: FontWeight.w900,
                fontSize: fontSize
            ),)),
    );
  }
}