import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const OutlineButton({
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
          backgroundColor: const Color(0x66111111),
          elevation: 0,
          side: const BorderSide(
            width: 1.0,
            color: Colors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              24,
            ),
          ),
        ),
        child: Text(text, style: kNavBarTextStyle),
      ),
    );
  }
}
