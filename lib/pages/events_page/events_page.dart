import 'package:flutter/material.dart';
import 'package:itechone/admin/events/widgets/admin_event_highlights.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/book_ticket_page/book_ticket_page.dart';
import 'package:itechone/pages/events_page/widgets/geekathon_user.dart';
import 'package:itechone/pages/events_page/widgets/hunerkada_user.dart';
import 'package:itechone/pages/events_page/widgets/indoor_sports_user.dart';
import 'package:itechone/pages/events_page/widgets/outdoor_sports_user.dart';
import 'package:itechone/pages/events_page/widgets/research_symposium_user.dart';
import 'package:itechone/pages/events_page/widgets/tech_preneur_galore_user.dart';
import 'package:itechone/pages/hunarkada_page/hunarkada_page.dart';
import 'package:itechone/pages/register_now_page/register_now.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as ownResponsiveWidget;
import 'package:itechone/widgets/main_button.dart';
import 'package:itechone/widgets/outline_button.dart';

class EventsPage extends StatelessWidget {
  static const String route = '/events';

  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ownResponsiveWidget.ResponsiveWidget.isMediumScreen(context) ||
              ownResponsiveWidget.ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: ownResponsiveWidget.ResponsiveWidget.isMediumScreen(context) ||
              ownResponsiveWidget.ResponsiveWidget.isSmallScreen(context)
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
                      Column(
                        children: [
                          const Text(
                            "IIT Latest Events",
                            style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          OutlineButton(
                            onPress: () {
                              Navigator.of(context)
                                  .pushNamed(RegisterNowPage.route);
                            },
                            text: "Register Now",
                          )
                        ],
                      )
                    ],
                  ),
                  const NavBar(
                    color: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              AdminEventHighlights(isAdmin: false, screenWidth: screenWidth),
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
                    IndoorSportsUser(),
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
                child: OutdoorSportsUser(screenHeight: screenHeight),
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
                    GeekathonUser(),
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
                        ResearchSymposiumUser(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              TechPreneurGaloreUser(),
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
                  Stack(
                    children: [
                      Image.asset("assets/images/guitar.png"),
                      HunerkadaUser(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainButton(
                      text: "See more",
                      onPress: () {
                        Navigator.pushNamed(context, HunarkadaPage.route);
                      })
                ],
              ),

              SizedBox(
                height: screenHeight * 0.1,
              ),
              SizedBox(
                width: double.infinity,
                height: screenHeight,
                child: Image.asset(
                  "assets/images/finale.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              // MainButton(
              //     text: "Book Ticket",
              //     onPress: () {
              //       Navigator.pushNamed(context, BookTicketPage.route);
              //     }),
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
