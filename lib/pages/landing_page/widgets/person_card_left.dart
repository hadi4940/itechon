import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart';

class PersonCardLeft extends StatelessWidget {
  final String tag;
  final String name;
  final String title;
  final String description;
  final String imagePath;
  final String buttonText;
  final VoidCallback onButtonPress;
  final bool isShowMainButton;
  const PersonCardLeft({
    super.key,
    required this.tag,
    required this.name,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.buttonText,
    required this.onButtonPress,
    required this.isShowMainButton,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final data = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tag,
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
          name,
          style: const TextStyle(
            color: kDarkPrimaryColor,
            fontSize: 30,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        Text(
          description,
          style: const TextStyle(color: kTextColor),
        ),
        const SizedBox(
          height: 12,
        ),
        isShowMainButton
            ? const SizedBox() //MainButton(text: buttonText, onPress: () {})
            : Row(
                children: [
                  Image.asset("assets/logo/twitter_logo.png"),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset("assets/logo/linkedin_logo.png")
                ],
              )
      ],
    );
    final image = Image.asset(
      imagePath,
    );
    return ResponsiveWidget(
      largeScreen: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenWidth * 0.4,
              child: data,
            ),
            SizedBox(
              width: screenWidth * 0.4,
              child: image,
            ),
          ],
        ),
      ),
      smallScreen: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 15),
            child: data,
          ),
          image,
        ],
      ),
    );
  }
}
