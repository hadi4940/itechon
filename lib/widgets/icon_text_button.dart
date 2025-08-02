import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';

class IconTextButton extends StatelessWidget {
  final VoidCallback onPress;
  const IconTextButton({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        textStyle: const TextStyle(color: kDarkPrimaryColor),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      onPressed: onPress,
      icon: Image.asset("assets/logo/attach_file.png"),
      label: const Text(
        'Attach Payment ScreenShot',
      ),
    );
  }
}
