import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart';

class Announcements extends StatelessWidget {
  Announcements({super.key});

  final image = SizedBox(
    child: Image.asset(
      "assets/images/announcement.png",
      fit: BoxFit.cover,
    ),
  );

  final data = const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "The IIT Echone launches cutting-edge AI services in healthcare.",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: kTextColor),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "15-04-2023",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: kTextColor),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "After extensive research and successful implementation strategies, our team is proud to announce the official launch of our AI-powered healthcare services. This marks a significant milestone in our mission to enhance and innovate healthcare delivery.",
        style: TextStyle(color: kTextColor),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const Text(
          "Latest",
          style: TextStyle(color: kGreyColor),
        ),
        const Text(
          "Announcements",
          style: kMainHeadingStyle,
        ),
        Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 35,
            ).copyWith(top: 15),
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 25,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                kBoxShadow,
              ],
            ),
            child: ResponsiveWidget(
              largeScreen: Row(
                children: [
                  Expanded(child: image),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 70),
                        child: data,
                      )),
                ],
              ),
              smallScreen: Column(
                children: [
                  SizedBox(width: double.infinity, child: image),
                  const SizedBox(
                    height: 15,
                  ),
                  data,
                ],
              ),
            ))
      ],
    );
  }
}
