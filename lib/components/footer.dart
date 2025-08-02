import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Footer extends StatelessWidget {
  Footer({super.key});
  final copyRight = const Text(
    "\u00a9 All rights reserved by itechone",
    style: TextStyle(
      color: Colors.white,
    ),
  );
  final socials = Row(
    children: [
      const Text(
        "Follow us on",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Image.asset("assets/logo/linkedin_logo.png"),
      const SizedBox(
        width: 10,
      ),
      Image.asset("assets/logo/twitter_logo.png"),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: kFooterColor,
          padding: const EdgeInsets.only(top: 25, left: 40, bottom: 45),
          child: ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 3,
                md: 3,
                sm: 6,
                xs: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset("assets/logo/logo.png"),
                  ],
                ),
              ),
              ResponsiveGridCol(
                lg: 3,
                md: 3,
                sm: 6,
                xs: 12,
                child: const FooterVStrip(
                  text1: "Pages",
                  text2: "Events",
                  text3: "Core",
                  text4: "Gallery",
                  text5: "Download",
                  text6: "Volunteer",
                ),
              ),
              // 3
              ResponsiveGridCol(
                lg: 3,
                md: 3,
                sm: 6,
                xs: 12,
                child: const FooterVStrip(
                  text1: "Support",
                  text2: "Contact",
                  text3: "Email:",
                  text4: "zasif@qau.edu.pk",
                  text5: "Address:",
                  text6: "Institute of Information Technology, QAU",
                ),
              ),
              // 4
              ResponsiveGridCol(
                lg: 3,
                md: 3,
                sm: 6,
                xs: 12,
                child: const FooterVStrip(
                  text1: "About",
                  text2:
                      "ITechon is an annual sports event held in IIT Department (QAU)",
                  text3:
                      "The event features a range of sports, including cricket, football, and basketball",
                  text4:
                      "ITechon aims to promote healthy competition and sportsmanship",
                  text5: "The event includes individual and team competitions",
                  text6: "Shields and prizes are awarded to the winners 5",
                ),
              ),
            ],
          ),
        ),
        Container(
          color: kSecondardColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: MediaQuery.of(context).size.width > 485
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    copyRight,
                    socials,
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    copyRight,
                    const SizedBox(
                      height: 8,
                    ),
                    socials,
                  ],
                ),
        )
      ],
    );
  }
}

class FooterVStrip extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;

  const FooterVStrip({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          text1,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text2,
          style: kFooterTextStyle,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          text3,
          style: kFooterTextStyle,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          text4,
          style: kFooterTextStyle,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          text5,
          style: kFooterTextStyle,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          text6,
          style: kFooterTextStyle,
        ),
      ],
    );
  }
}
