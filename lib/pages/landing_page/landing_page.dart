import 'package:flutter/material.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/events_page/events_page.dart';
import 'package:itechone/pages/landing_page/widgets/about_us.dart';
import 'package:itechone/pages/landing_page/widgets/announcements.dart';
import 'package:itechone/pages/landing_page/widgets/join_us.dart';
import 'package:itechone/pages/landing_page/widgets/langing_page_banner.dart';
import 'package:itechone/pages/landing_page/widgets/person_card_left.dart';
import 'package:itechone/pages/landing_page/widgets/person_card_right.dart';
import 'package:itechone/responsive/responsive_widget.dart';

class LandingPage extends StatelessWidget {
  static const String route = '/';

  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ResponsiveWidget(
      largeScreen: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: ResponsiveWidget.isSmallScreen(context) ||
                ResponsiveWidget.isMediumScreen(context)
            ? AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: const IconThemeData(color: Colors.white),
              )
            : null,
        drawer: ResponsiveWidget.isSmallScreen(context) ||
                ResponsiveWidget.isMediumScreen(context)
            ? const DrawerForMobile()
            : null,
        body: SingleChildScrollView(
          child: ResponsiveWidget(
            largeScreen: Column(
              children: [
                const Stack(
                  children: [
                    LandingPageBanner(),
                    NavBar(
                      color: kNavBarColor1,
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                const AboutUs(),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                PersonCardLeft(
                  tag: "Voice of",
                  name: "Sidra Batool Kazmi",
                  title: "Head Mentor",
                  description:
                      "At I.I.T, students engage in real-world experiences through mock interviews, job fairs, and recruitment drives, fostering a sense of accomplishment. We prioritize a supportive learning environment and aim to enhance education accessibility, leverage modern technology, and shape responsible individuals. Our research-focused approach cultivates intellectual leaders who excel in their fields and contribute significantly to society. I.I.T offers research-oriented graduate programs (MS and PhD) and is partnering with international research labs for impactful real-life problem-solving.",
                  imagePath: "assets/images/person_card_1.png",
                  buttonText: "",
                  onButtonPress: () {},
                  isShowMainButton: true,
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                PersonCardRight(
                  tag: "Latest",
                  name: "IIT Events",
                  description:
                      "Exciting events ahead at the IIT! From insightful lectures to cultural festivals and sports, there's something for everyone. Join for enriching experiences and a vibrant community vibe!",
                  imagePath: 'assets/images/person_card_2.png',
                  isPoints: true,
                  buttonText: "Explore more",
                  onPress: () {
                    Navigator.pushNamed(context, EventsPage.route);
                  },
                  isShowMainButton: true,
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                const JoinUs(),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Announcements(),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                Footer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
