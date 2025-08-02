import 'package:flutter/material.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/pages/landing_page/widgets/person_card_left.dart';
import 'package:itechone/pages/landing_page/widgets/person_card_right.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/widgets/common_banner.dart';

class CorePage extends StatelessWidget {
  static const String route = '/core';
  const CorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isSmallScreen(context)
          ? const DrawerForMobile()
          : null,
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          largeScreen: Column(
            children: [
              const Stack(
                children: [
                  CommonBanner(
                    imagePath: "assets/images/core_banner.png",
                    text: "IIT Core",
                  ),
                  NavBar(
                    color: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              PersonCardLeft(
                tag: "Voice of",
                name: "Sidra Batool Kazmi",
                title: "HEAD MENTOR",
                description:
                    "At I.I.T, students engage in real-world experiences through mock interviews, job fairs, and recruitment drives, fostering a sense of accomplishment. We prioritize a supportive learning environment and aim to enhance education accessibility, leverage modern technology, and shape responsible individuals. Our research-focused approach cultivates intellectual leaders who excel in their fields and contribute significantly to society. I.I.T offers research-oriented graduate programs (MS and PhD) and is partnering with international research labs for impactful real-life problem-solving.",
                imagePath: "assets/images/person_card_1.png",
                buttonText: "",
                onButtonPress: () {},
                isShowMainButton: false,
              ),
              PersonCardRight(
                tag: "Voice of",
                name: "Sidra Batool Kazmi",
                title: "STUDENT AFFAIRS INCHARGE",
                description:
                    "At I.I.T, students engage in real-world experiences through mock interviews, job fairs, and recruitment drives, fostering a sense of accomplishment. We prioritize a supportive learning environment and aim to enhance education accessibility, leverage modern technology, and shape responsible individuals. Our research-focused approach cultivates intellectual leaders who excel in their fields and contribute significantly to society. I.I.T offers research-oriented graduate programs (MS and PhD) and is partnering with international research labs for impactful real-life problem-solving.",
                imagePath: "assets/images/core_left.png",
                buttonText: "",
                onPress: () {},
                isPoints: false,
                isShowMainButton: false,
              ),
              PersonCardLeft(
                tag: "Voice of",
                name: "Sidra Batool Kazmi",
                title: "ILC HEAD",
                description:
                    "At I.I.T, students engage in real-world experiences through mock interviews, job fairs, and recruitment drives, fostering a sense of accomplishment. We prioritize a supportive learning environment and aim to enhance education accessibility, leverage modern technology, and shape responsible individuals. Our research-focused approach cultivates intellectual leaders who excel in their fields and contribute significantly to society. I.I.T offers research-oriented graduate programs (MS and PhD) and is partnering with international research labs for impactful real-life problem-solving.",
                imagePath: "assets/images/person_card_1.png",
                buttonText: "",
                onButtonPress: () {},
                isShowMainButton: false,
              ),
              /* PersonCardRight(
                tag: "Voice of",
                name: "Sidra Batool Kazmi",
                title: "Head Mentor",
                description:
                    "At I.I.T, students engage in real-world experiences through mock interviews, job fairs, and recruitment drives, fostering a sense of accomplishment. We prioritize a supportive learning environment and aim to enhance education accessibility, leverage modern technology, and shape responsible individuals. Our research-focused approach cultivates intellectual leaders who excel in their fields and contribute significantly to society. I.I.T offers research-oriented graduate programs (MS and PhD) and is partnering with international research labs for impactful real-life problem-solving.",
                imagePath: "assets/images/core_left.png",
                buttonText: "",
                onPress: () {},
                isPoints: false,
                isShowMainButton: false,
              ),*/
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
