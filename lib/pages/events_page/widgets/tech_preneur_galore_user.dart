import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/events_page/widgets/tech_card.dart';
import 'package:itechone/pages/single_sport_page/single_sport_page.dart';

class TechPreneurGaloreUser extends StatelessWidget {
  TechPreneurGaloreUser({
    super.key,
  });
  final CollectionReference _techPreneurGalore =
      FirebaseFirestore.instance.collection("tech_preneur_galore");
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _techPreneurGalore.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<QueryDocumentSnapshot<Object?>> documentSnapshot =
                streamSnapshot.data!.docs;
            return Column(
              children: [
                const Text(
                  "Tech preneur's Galore",
                  style: kMainHeadingStyle,
                ),
                const SizedBox(
                  height: 15,
                ),
                TechCard(
                  name: documentSnapshot[0]['name'],
                  description: documentSnapshot[0]['description'],
                  imagePath: "assets/images/startup.png",
                  isReverse: false,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SingleSportPage(
                              sportName: documentSnapshot[0]['name'],
                              description: documentSnapshot[0]['description'],
                              imagePath: "assets/images/startup.png",
                              venue: "QUA",
                              date: "31 Dec 2024",
                              registerTeamOrSolo: "Register as Solo",
                              showWinners: false);
                        },
                      ),
                    );
                  },
                ),
                TechCard(
                  name: documentSnapshot[1]['name'],
                  description: documentSnapshot[1]['description'],
                  imagePath: "assets/images/markets.png",
                  isReverse: true,
                  onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SingleSportPage(
                              sportName: documentSnapshot[1]['name'],
                              description: documentSnapshot[1]['description'],
                              imagePath: "assets/images/markets.png",
                              venue: "QUA",
                              date: "31 Dec 2024",
                              registerTeamOrSolo: "Register as Solo",
                              showWinners: false);
                        },
                      ),
                    );
                  },
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
