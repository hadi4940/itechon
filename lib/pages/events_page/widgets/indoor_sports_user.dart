import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itechone/pages/events_page/widgets/event_card.dart';
import 'package:itechone/pages/single_sport_page/single_sport_page.dart';
import 'package:responsive_grid/responsive_grid.dart';

class IndoorSportsUser extends StatelessWidget {
  IndoorSportsUser({
    super.key,
  });
  final CollectionReference _indoorSports =
      FirebaseFirestore.instance.collection("events");
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _indoorSports.snapshots(),
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
                child: EventCard(
                  eventName: documentSnapshot[0]['name'],
                  team: documentSnapshot[0]['team_type'],
                  date: documentSnapshot[0]['date'],
                  venue: documentSnapshot[0]['venue'],
                  imagePath: "assets/images/snooker.png",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleSportPage(
                          showWinners: true,
                          imagePath: "images/snooker_banner.png",
                          sportName: documentSnapshot[0]['name'],
                          registerTeamOrSolo: documentSnapshot[0]['team_type'],
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
                  imagePath: "assets/images/Badminton.png",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleSportPage(
                          showWinners: true,
                          imagePath: "images/badminton_banner.png",
                          sportName: documentSnapshot[1]['name'],
                          registerTeamOrSolo: documentSnapshot[1]['team_type'],
                          description: documentSnapshot[1]['description'],
                          venue: documentSnapshot[1]['venue'],
                          date: documentSnapshot[1]['date'],
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
                  eventName: documentSnapshot[2]['name'],
                  team: documentSnapshot[2]['team_type'],
                  date: documentSnapshot[2]['date'],
                  venue: documentSnapshot[2]['venue'],
                  imagePath: "assets/images/TableTennis.png",
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleSportPage(
                          showWinners: true,
                          imagePath: "images/tennis_banner.png",
                          sportName: documentSnapshot[2]['name'],
                          registerTeamOrSolo: documentSnapshot[2]['team_type'],
                          description: documentSnapshot[2]['description'],
                          venue: documentSnapshot[2]['venue'],
                          date: documentSnapshot[2]['date'],
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
      },
    );
  }
}
