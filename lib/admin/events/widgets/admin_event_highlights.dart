import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/widgets/main_button.dart';

class AdminEventHighlights extends StatelessWidget {
  AdminEventHighlights({
    super.key,
    required this.screenWidth,
    required this.isAdmin,
  });

  final double screenWidth;
  final bool isAdmin;
  final CollectionReference _eventHighlights =
      FirebaseFirestore.instance.collection("event_highlights");
  final TextEditingController _eventsHighlightsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> update(DocumentSnapshot? documentSnapshot) async {
      if (documentSnapshot != null) {
        _eventsHighlightsController.text = documentSnapshot["description"];
      }
      await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  controller: _eventsHighlightsController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String newDescription =
                        _eventsHighlightsController.text;

                    try {
                      await _eventHighlights.doc(documentSnapshot!.id).update({
                        "description": newDescription,
                      });
                      _eventsHighlightsController.text = "";
                      Fluttertoast.showToast(msg: 'Updated!');
                    } catch (e) {
                      Fluttertoast.showToast(msg: 'Network error! $e');
                    }
                  },
                  child: const Text("Update"),
                )
              ],
            ),
          );
        },
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Latest Event",
            style: kSmallSubHeading,
          ),
          StreamBuilder(
            stream: _eventHighlights.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[0];
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Event Highlights",
                          style:
                              kMainHeadingWithLineStyle.copyWith(fontSize: 32),
                        ),
                        isAdmin
                            ? SizedBox(
                                width: 80,
                                child: MainButton(
                                  text: "Edit",
                                  onPress: () {
                                    update(documentSnapshot);
                                  },
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    Text(documentSnapshot['description']),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
        ],
      ),
    );
  }
}
