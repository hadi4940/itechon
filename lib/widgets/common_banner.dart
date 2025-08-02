import 'package:flutter/material.dart';

class CommonBanner extends StatelessWidget {
  final String imagePath;
  final String text;
  const CommonBanner({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: screenWidth,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 36, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        )
      ],
    );
  }
}
