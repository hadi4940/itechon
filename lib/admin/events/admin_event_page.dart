import 'package:flutter/material.dart';
import 'package:itechone/admin/admin_components/admin_navbar.dart';
import 'package:itechone/admin/events/widgets/admin_event_highlights.dart';
import 'package:itechone/admin/events/widgets/geekathon.dart';
import 'package:itechone/admin/events/widgets/hunerkada.dart';
import 'package:itechone/admin/events/widgets/indoor_sports.dart';
import 'package:itechone/admin/events/widgets/outdoor_sports.dart';
import 'package:itechone/admin/events/widgets/research_symposium.dart';
import 'package:itechone/admin/events/widgets/tech_preneur_galore.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as ownResponsiveWidget;
import 'package:itechone/widgets/outline_button.dart';

class AdminEventsPage extends StatelessWidget {
  static const String route = '/admin_events';

  const AdminEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: !ownResponsiveWidget.ResponsiveWidget.isLargeScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: !ownResponsiveWidget.ResponsiveWidget.isLargeScreen(context)
          ? const DrawerForMobile()
          : null,
      body: SingleChildScrollView(
        child: ownResponsiveWidget.ResponsiveWidget(
          largeScreen: Column(
            children: [
              Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: screenWidth,
                        height: screenHeight,
                        child: Image.asset(
                          "assets/images/event_banner.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            "IIT Latest Events",
                            style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          /*OutlineButton(
                            onPress: () {},
                            text: "Register Now",
                          )*/
                        ],
                      )
                    ],
                  ),
                  const AdminNavBar(
                    color: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              AdminEventHighlights(isAdmin: true, screenWidth: screenWidth),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
                child: Column(
                  children: [
                    const Text(
                      "Sports",
                      style: kMainHeadingStyle,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sports type",
                        style: kSmallSubHeading,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Indoor Sports",
                        style: kMainHeadingWithLineStyle.copyWith(fontSize: 32),
                      ),
                    ),
                    IndoorSports(),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/outdoorSport.png",
                    ),
                  ),
                ),
                child: OutdoorSports(screenHeight: screenHeight),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              //Geehathon
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
                child: Column(
                  children: [
                    const Text(
                      "Geekathon",
                      style: kMainHeadingStyle,
                    ),
                    Geekathon(),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              // Research Symposium
              Stack(
                children: [
                  Image.asset("assets/images/book.png"),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Research Symposium",
                          style: kMainHeadingStyle,
                        ),
                        ResearchSymposium(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              TechPreneurGalore(),
              // Hunerkada
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Column(
                children: [
                  const Text(
                    "Hunerkada",
                    style: kMainHeadingStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  Hunerkada(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),

              SizedBox(
                height: screenHeight * 0.1,
              ),
              SizedBox(
                width: double.infinity,
                height: screenHeight,
                child: Image.asset(
                  "assets/images/final.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
