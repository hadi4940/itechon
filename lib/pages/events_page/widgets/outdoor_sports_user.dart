import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/events_page/widgets/event_card.dart';
import 'package:itechone/pages/single_sport_page/single_sport_page.dart';
import 'package:responsive_grid/responsive_grid.dart';

class OutdoorSportsUser extends StatelessWidget {
  OutdoorSportsUser({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;
  final CollectionReference _outdoorSports =
      FirebaseFirestore.instance.collection("outdoor_sports");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _outdoorSports.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<QueryDocumentSnapshot<Object?>> documentSnapshot =
                streamSnapshot.data!.docs;
            return ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  lg: 4,
                  md: 6,
                  sm: 12,
                  child: SizedBox(
                    height: screenHeight * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sports type",
                          style: kSmallSubHeading.copyWith(color: Colors.white),
                        ),
                        const Text(
                          "Outdoor Sports",
                          style: TextStyle(fontSize: 32, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 4,
                  md: 6,
                  sm: 12,
                  child: EventCard(
                    eventName: documentSnapshot[0]['name'],
                    team: documentSnapshot[0]['team_type'],
                    date: documentSnapshot[0]['date'],
                    venue: documentSnapshot[0]['venue'],
                    imagePath: "assets/images/futsal.png",
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleSportPage(
                            showWinners: true,
                            imagePath: "images/futsal_banner.png",
                            sportName: documentSnapshot[0]['name'],
                            registerTeamOrSolo: documentSnapshot[0]
                                ['team_type'],
                            description: documentSnapshot[0]['description'],
                            venue: documentSnapshot[0]['venue'],
                            date: documentSnapshot[0]['date'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ResponsiveGridCol(
                  lg: 4,
                  md: 6,
                  sm: 12,
                  child: EventCard(
                    eventName: documentSnapshot[1]['name'],
                    team: documentSnapshot[1]['team_type'],
                    date: documentSnapshot[1]['date'],
                    venue: documentSnapshot[1]['venue'],
                    imagePath: "assets/images/cricket.png",
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SingleSportPage(
                            showWinners: true,
                            imagePath: "images/cricket_banner.png",
                            sportName: documentSnapshot[1]['name'],
                            registerTeamOrSolo: documentSnapshot[1]
                                ['team_type'],
                            description: documentSnapshot[1]['description'],
                            venue: documentSnapshot[1]['venue'],
                            date: documentSnapshot[1]['date'],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
