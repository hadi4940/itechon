import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/admin/events/widgets/admin_hunerkada_card.dart';
import 'package:itechone/widgets/main_button.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Hunerkada extends StatefulWidget {
  const Hunerkada({
    super.key,
  });

  @override
  State<Hunerkada> createState() => _HunerkadaState();
}

class _HunerkadaState extends State<Hunerkada> {
  final CollectionReference _hunerkada =
      FirebaseFirestore.instance.collection("hunerkada");

  final TextEditingController _descriptionController = TextEditingController();

  // List of items in our dropdown menu
  var items = ['art', 'drama', 'debates', 'literature', 'music', 'poetry'];

  @override
  Widget build(BuildContext context) {
    // Initial Selected Value
    String dropdownvalue = 'art';
    void update() async {
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(
            builder: (context, setState) => Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
              ),
              child: Wrap(
                children: [
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
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
                        final String description = _descriptionController.text;

                        try {
                          await _hunerkada.doc(dropdownvalue).update({
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
            ),
          );
        },
      );
    }

    void delete() async {
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(
            builder: (context, setState) => Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
              ),
              child: Wrap(
                children: [
                  DropdownButton(
                    // Initial Value
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MainButton(
                      text: "Delete",
                      onPress: () async {
                        try {
                          await _hunerkada.doc(dropdownvalue).update({
                            "description": "Not Open",
                          });

                          Fluttertoast.showToast(msg: "Deleted!");
                        } catch (e) {
                          Fluttertoast.showToast(msg: "Network Error! $e");
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return StreamBuilder(
      stream: _hunerkada.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          final List<QueryDocumentSnapshot<Object?>> documentSnapshot =
              streamSnapshot.data!.docs;
          return Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/images/guitar.png"),
                  ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        lg: 3,
                        md: 3,
                        sm: 12,
                        child: AdminHunerkadaCard(
                          name: documentSnapshot[0]['name'],
                          imagePath: "assets/images/arts.png",
                          description: documentSnapshot[0]['description'],
                        ),
                      ),
                      ResponsiveGridCol(
                        lg: 3,
                        md: 3,
                        sm: 12,
                        child: AdminHunerkadaCard(
                          name: documentSnapshot[1]['name'],
                          imagePath: "assets/images/debats2.png",
                          description: documentSnapshot[1]['description'],
                        ),
                      ),
                      ResponsiveGridCol(
                        lg: 3,
                        md: 3,
                        sm: 12,
                        child: AdminHunerkadaCard(
                          name: documentSnapshot[2]['name'],
                          imagePath: "assets/images/debats.png",
                          description: documentSnapshot[2]['description'],
                        ),
                      ),
                      ResponsiveGridCol(
                        lg: 3,
                        md: 3,
                        sm: 12,
                        child: AdminHunerkadaCard(
                          name: documentSnapshot[3]['name'],
                          imagePath: "assets/images/literature.png",
                          description: documentSnapshot[3]['description'],
                        ),
                      ),
                      ResponsiveGridCol(
                        lg: 3,
                        md: 3,
                        sm: 12,
                        child: AdminHunerkadaCard(
                          name: documentSnapshot[4]['name'],
                          imagePath: "assets/images/music.png",
                          description: documentSnapshot[4]['description'],
                        ),
                      ),
                      ResponsiveGridCol(
                        lg: 3,
                        md: 3,
                        sm: 12,
                        child: AdminHunerkadaCard(
                          name: documentSnapshot[5]['name'],
                          imagePath: "assets/images/poetry.png",
                          description: documentSnapshot[5]['description'],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MainButton(
                text: "Update",
                onPress: () {
                  update();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              MainButton(
                text: "Delete",
                onPress: () {
                  delete();
                },
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
