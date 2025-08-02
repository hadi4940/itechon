import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const MainButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 160,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              24,
            ))),
        child: Text(text, style: kNavBarTextStyle),
      ),
    );
  }
}
