import 'package:flutter/material.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/pages/events_page/widgets/hunerkada_card.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as own_responsive_widget;
import 'package:itechone/widgets/main_button.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HunarkadaPage extends StatelessWidget {
  static const String route = '/hunarkada';

  const HunarkadaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: own_responsive_widget.ResponsiveWidget.isMediumScreen(context) ||
              own_responsive_widget.ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: own_responsive_widget.ResponsiveWidget.isMediumScreen(context) ||
              own_responsive_widget.ResponsiveWidget.isSmallScreen(context)
          ? const DrawerForMobile()
          : null,
      body: SingleChildScrollView(
        child: own_responsive_widget.ResponsiveWidget(
          largeScreen: Column(
            children: [
              const NavBar(color: Color(0x600E356B)),
              Image.asset(
                "assets/images/guitar.png",
                fit: BoxFit.cover,
                height: screenHeight * 0.85,
                width: screenWidth,
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      lg: 4,
                      md: 4,
                      sm: 12,
                      child: const HunerkadaCard(
                          name: "arts",
                          imagePath: "assets/images/arts.png",
                          description:
                              "Art: Expression of Emotion Colorful, creative, and captivating. Evokes feelings, sparks imagination, and brings joy. A universal language, transcending cultures and borders, inspiring beauty and wonder."
                          // "Factory video analytics can identify production bottlenecks and streamline processes, increasing efficiency and reducing costs.",
                          ),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      md: 4,
                      sm: 12,
                      child: const HunerkadaCard(
                          name: "Music",
                          imagePath: "assets/images/music.png",
                          description:
                              "Music: The Universal Language Music evokes emotions, inspires creativity, and unites people. It comforts, energizes, and enriches our lives. A universal language, it transcends cultures and borders, boosting well-being and belonging."
                          //"Factory video analytics can identify production bottlenecks and streamline processes, increasing efficiency and reducing costs.",
                          ),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      md: 4,
                      sm: 12,
                      child: const HunerkadaCard(
                          name: "Literature",
                          imagePath: "assets/images/literature.png",
                          description:
                              "Literature: Window to World Timeless, thought-provoking, and transformative. Stories, poems, and plays explore human experiences, emotions, and ideas. Reflecting cultures, sparking imagination, and inspiring empathy."
                          // "Factory video analytics can identify production bottlenecks and streamline processes, increasing efficiency and reducing costs.",
                          ),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      md: 4,
                      sm: 12,
                      child: const HunerkadaCard(
                          name: "Poetry",
                          imagePath: "assets/images/poetry.png",
                          description:
                              //"Factory video analytics can identify production bottlenecks and streamline processes, increasing efficiency and reducing costs.",
                              "Poetry: Soul's Expression Beautiful, evocative, and concise. Words dance, emotions flow, and thoughts unfold. Capturing life's essence, sparking imagination, and touching hearts."),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      md: 4,
                      sm: 12,
                      child: const HunerkadaCard(
                          name: "darama",
                          imagePath: "assets/images/debats2.png",
                          description:
                              // "Factory video analytics can identify production bottlenecks and streamline processes, increasing efficiency and reducing costs.",
                              "Drama: Storytelling Through Action Emotive, engaging, and dynamic. Actors bring characters to life, evoking feelings and sparking imagination. A universal language, transcending cultures and borders, sharing human experiences."),
                    ),
                    ResponsiveGridCol(
                      lg: 4,
                      md: 4,
                      sm: 12,
                      child: const HunerkadaCard(
                          name: "Debats",
                          imagePath: "assets/images/debats.png",
                          description:
                              //"Factory video analytics can identify production bottlenecks and streamline processes, increasing efficiency and reducing costs.",
                              "Debate: Exchange of Ideas Respectful, engaging, and enlightening. Participants share perspectives, listen actively, and grow. Fostering critical thinking, effective communication, and informed decisions."),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              /*MainButton(text: "Register Now ", onPress: () {}),
              const SizedBox(
                height: 10,
              ),
              TextButton(onPressed: () {}, child: const Text("Download")),
              SizedBox(
                height: screenHeight * 0.1,
              ),*/
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
