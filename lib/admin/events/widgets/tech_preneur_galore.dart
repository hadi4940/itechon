import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/admin/events/widgets/admin_tech_card.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/widgets/main_button.dart';

class TechPreneurGalore extends StatelessWidget {
  TechPreneurGalore({
    super.key,
  });
  final CollectionReference _techPreneurGalore =
      FirebaseFirestore.instance.collection("tech_preneur_galore");
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void update(DocumentSnapshot documentSnapshot) async {
      _nameController.text = documentSnapshot["name"];
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
                      final String description = _descriptionController.text;

                      try {
                        await _techPreneurGalore
                            .doc(documentSnapshot.id)
                            .update({
                          "name": name,
                          "description": description,
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
                AdminTechCard(
                  name: documentSnapshot[0]['name'],
                  description: documentSnapshot[0]['description'],
                  imagePath: "assets/images/startup.png",
                  isReverse: false,
                  onPress: () {
                    update(documentSnapshot[0]);
                  },
                ),
                AdminTechCard(
                  name: documentSnapshot[1]['name'],
                  description: documentSnapshot[1]['description'],
                  imagePath: "assets/images/markets.png",
                  isReverse: true,
                  onPress: () {
                    update(documentSnapshot[1]);
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
