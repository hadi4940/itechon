import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itechone/pages/events_page/widgets/hunerkada_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

class HunerkadaUser extends StatelessWidget {
  HunerkadaUser({
    super.key,
  });
  final CollectionReference _hunerkada =
      FirebaseFirestore.instance.collection("hunerkada");

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _hunerkada.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          final List<QueryDocumentSnapshot<Object?>> documentSnapshot =
              streamSnapshot.data!.docs;
          return ResponsiveGridRow(
            children: [
              // ResponsiveGridCol(
              //   lg: 3,
              //   md: 3,
              //   sm: 12,
              //   child: HunerkadaCard(
              //     name: documentSnapshot[0]['name'],
              //     imagePath: "assets/images/arts.png",
              //     description: documentSnapshot[0]['description'],
              //   ),
              // ),
              // ResponsiveGridCol(
              //   lg: 3,
              //   md: 3,
              //   sm: 12,
              //   child: HunerkadaCard(
              //     name: documentSnapshot[1]['name'],
              //     imagePath: "assets/images/debats2.png",
              //     description: documentSnapshot[1]['description'],
              //   ),
              // ),
              // ResponsiveGridCol(
              //   lg: 3,
              //   md: 3,
              //   sm: 12,
              //   child: HunerkadaCard(
              //     name: documentSnapshot[2]['name'],
              //     imagePath: "assets/images/debats.png",
              //     description: documentSnapshot[2]['description'],
              //   ),
              // ),
              ResponsiveGridCol(
                lg: 3,
                md: 3,
                sm: 12,
                child: HunerkadaCard(
                  name: documentSnapshot[3]['name'],
                  imagePath: "assets/images/literature.png",
                  description: documentSnapshot[3]['description'],
                ),
              ),
              ResponsiveGridCol(
                lg: 3,
                md: 3,
                sm: 12,
                child: HunerkadaCard(
                  name: documentSnapshot[4]['name'],
                  imagePath: "assets/images/music.png",
                  description: documentSnapshot[4]['description'],
                ),
              ),
              ResponsiveGridCol(
                lg: 3,
                md: 3,
                sm: 12,
                child: HunerkadaCard(
                  name: documentSnapshot[5]['name'],
                  imagePath: "assets/images/poetry.png",
                  description: documentSnapshot[5]['description'],
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
