import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/admin/events/widgets/admin_event_card.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/widgets/main_button.dart';
import 'package:responsive_grid/responsive_grid.dart';

class OutdoorSports extends StatelessWidget {
  OutdoorSports({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;
  final CollectionReference _outdoorSports =
      FirebaseFirestore.instance.collection("outdoor_sports");
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _teamController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void update(DocumentSnapshot documentSnapshot) async {
      _nameController.text = documentSnapshot["name"];
      _dateController.text = documentSnapshot["date"];
      _teamController.text = documentSnapshot["team_type"];
      _venueController.text = documentSnapshot["venue"];
      _descriptionController.text = documentSnapshot["description"];

      await showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
            ),
            child: Wrap(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _teamController,
                  decoration: const InputDecoration(labelText: 'Register as'),
                ),
                TextField(
                  controller: _dateController,
                  decoration: const InputDecoration(labelText: 'Date'),
                ),
                TextField(
                  controller: _venueController,
                  decoration: const InputDecoration(labelText: 'Venue'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MainButton(
                    text: "Update",
                    onPress: () async {
                      final String name = _nameController.text;
                      final String date = _dateController.text;
                      final String venue = _venueController.text;
                      final String registerAs = _teamController.text;
                      final String description = _descriptionController.text;

                      try {
                        await _outdoorSports.doc(documentSnapshot.id).update({
                          "name": name,
                          "date": date,
                          "venue": venue,
                          "team_type": registerAs,
                          "description": description
                        });
                        Fluttertoast.showToast(msg: "Updated!");
                      } catch (e) {
                        Fluttertoast.showToast(msg: "Network Error! $e");
                      }
                    },
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    void delete(DocumentSnapshot documentSnapshot) async {
      try {
        await _outdoorSports.doc(documentSnapshot.id).update({
          "date": "-",
          "venue": "-",
          "team_type": "Not Open",
        });
        Fluttertoast.showToast(msg: "Deleted!");
      } catch (e) {
        Fluttertoast.showToast(msg: "Network Error! $e");
      }
    }

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
                  child: AdminEventCard(
                    eventName: documentSnapshot[0]['name'],
                    team: documentSnapshot[0]['team_type'],
                    date: documentSnapshot[0]['date'],
                    venue: documentSnapshot[0]['venue'],
                    imagePath: "assets/images/cricket.png",
                    onPressUpdate: () {
                      update(documentSnapshot[0]);
                    },
                    onPressDelete: () {
                      delete(documentSnapshot[0]);
                    },
                  ),
                ),
                ResponsiveGridCol(
                  lg: 4,
                  md: 6,
                  sm: 12,
                  child: AdminEventCard(
                    eventName: documentSnapshot[1]['name'],
                    team: documentSnapshot[1]['team_type'],
                    date: documentSnapshot[1]['date'],
                    venue: documentSnapshot[1]['venue'],
                    imagePath: "assets/images/futsal.png",
                    onPressUpdate: () {
                      update(documentSnapshot[1]);
                    },
                    onPressDelete: () {
                      delete(documentSnapshot[1]);
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
