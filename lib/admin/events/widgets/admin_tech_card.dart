import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/widgets/main_button.dart';

class AdminTechCard extends StatelessWidget {
  final String name;
  final String description;
  final VoidCallback onPress;
  final String imagePath;
  final bool isReverse;
  const AdminTechCard({
    super.key,
    required this.name,
    required this.description,
    required this.onPress,
    required this.imagePath,
    required this.isReverse,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final image = Image.asset(imagePath);
    final data = Padding(
      padding: EdgeInsets.all(screenWidth * 0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: kMainHeadingWithLineStyle.copyWith(fontSize: 26),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(description),
          const SizedBox(
            height: 10,
          ),
          MainButton(text: "Edit", onPress: onPress),
        ],
      ),
    );
    return ResponsiveWidget(
      largeScreen: Row(
        children: [
          isReverse ? const SizedBox() : Expanded(flex: 1, child: image),
          Expanded(
            flex: 1,
            child: data,
          ),
          isReverse
              ? Expanded(flex: 1, child: Image.asset(imagePath))
              : const SizedBox(),
        ],
      ),
      smallScreen: Column(
        children: [
          image,
          data,
        ],
      ),
    );
  }
}
