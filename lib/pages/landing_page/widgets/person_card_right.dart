import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/landing_page/widgets/iit_event_points.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/widgets/main_button.dart';

class PersonCardRight extends StatelessWidget {
  final String tag;
  final String name;
  final String? title;
  final String description;
  final bool isPoints;
  final String imagePath;
  final String buttonText;
  final VoidCallback onPress;
  final bool isShowMainButton;

  const PersonCardRight({
    super.key,
    required this.tag,
    required this.name,
    this.title,
    required this.isPoints,
    required this.description,
    required this.imagePath,
    required this.buttonText,
    required this.onPress,
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
        title == null
            ? const SizedBox(
                width: 0,
                height: 0,
              )
            : Text(
                title!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
        Text(
          description,
          style: const TextStyle(color: kTextColor),
        ),
        isPoints ? const IitEventPointsLink() : const SizedBox(),
        const SizedBox(
          height: 12,
        ),
        isShowMainButton
            ? MainButton(text: buttonText, onPress: onPress)
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
        padding: EdgeInsets.only(right: screenWidth * 0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: screenWidth * 0.4,
              child: image,
            ),
            SizedBox(
              width: screenWidth * 0.4,
              child: data,
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
