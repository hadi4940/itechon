import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final bool isRichInput;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    this.obscureText = false,
    //obscureText = true,
    required this.isRichInput,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 10),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [kBoxShadow],
        ),
        child: TextField(
          controller: textEditingController,

          maxLines: isRichInput ? 7 : 1,
          obscureText: obscureText,
          //obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
