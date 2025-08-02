import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/admin/admin_components/admin_navbar.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/widgets/custom_textfield.dart';

class AdminEventUpdatePage extends StatefulWidget {
  static const String route = '/admin_events_uodate';

  const AdminEventUpdatePage({super.key});

  @override
  State<AdminEventUpdatePage> createState() => _AdminEventUpdatePageState();
}

class _AdminEventUpdatePageState extends State<AdminEventUpdatePage> {
  // Initial Selected Value
  String event = 'Badminton';

  // List of items in our dropdown menu
  var dropdownEvents = [
    'Badminton',
    'Table Tanis',
    'Snooker',
    'Cricket',
    'Futsal',
    "Speed Programming",
    "Gaming",
    "Nerd's Quiz",
    "Seminars",
    "Workshop",
    "Poster Competition",
    "Pitch Startup Idea",
    "Mini Market",
    "Art",
    "Drama",
    "Debates",
    "Literature",
    "Music",
    "Poetry",
  ];
  final CollectionReference _eventsWinnerUpdate =
      FirebaseFirestore.instance.collection("events_winner_update");
  final TextEditingController qf1Controller = TextEditingController();
  final TextEditingController qf2Controller = TextEditingController();
  final TextEditingController qf3Controller = TextEditingController();
  final TextEditingController qf4Controller = TextEditingController();

  final TextEditingController sf1Controller = TextEditingController();
  final TextEditingController sf2Controller = TextEditingController();

  final TextEditingController fController = TextEditingController();

  _updateWinner(TextEditingController controller, String field) async {
    if (controller.text.isEmpty) {
      Fluttertoast.showToast(msg: "Fill the corresponding field");
      return;
    }
    await _eventsWinnerUpdate.doc(event).update({field: controller.text});
    Fluttertoast.showToast(msg: "Winner Updated");
    controller.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: !ResponsiveWidget.isLargeScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: !ResponsiveWidget.isLargeScreen(context)
          ? const DrawerForMobile()
          : null,
      body: ResponsiveWidget(
        largeScreen: SingleChildScrollView(
          child: Column(
            children: [
              const AdminNavBar(
                color: Color(0x600E356B),
              ),
              Image.asset(
                "assets/images/gallery_3.png",
                fit: BoxFit.cover,
                height: screenHeight * 0.6,
                width: screenWidth,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 35, horizontal: screenWidth * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropdownButton(
                      value: event,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: dropdownEvents.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          event = newValue!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "WINNERS",
                        style: kSportSmallHeading,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Winners of Quarter final",
                      style: kSportSmallHeading,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "Quarter Final 1 Winner",
                            textEditingController: qf1Controller,
                            isRichInput: false,
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              _updateWinner(qf1Controller, "qf1");
                            },
                            icon: const Icon(Icons.update))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "Quarter Final 2 Winner",
                            textEditingController: qf2Controller,
                            isRichInput: false,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _updateWinner(qf2Controller, "qf2");
                            },
                            icon: const Icon(Icons.update))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "Quarter Final 3 Winner",
                            textEditingController: qf3Controller,
                            isRichInput: false,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _updateWinner(qf3Controller, "qf3");
                            },
                            icon: const Icon(Icons.update))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "Quarter Final 4 Winner",
                            textEditingController: qf4Controller,
                            isRichInput: false,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _updateWinner(qf4Controller, "qf4");
                            },
                            icon: const Icon(Icons.update))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Winners of Semi final:",
                      style: kSportSmallHeading,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "Semi Final 1 Winner",
                            textEditingController: sf1Controller,
                            isRichInput: false,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _updateWinner(sf1Controller, "sf1");
                            },
                            icon: const Icon(Icons.update))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "Semi Final 2 Winner",
                            textEditingController: sf2Controller,
                            isRichInput: false,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _updateWinner(sf2Controller, "sf2");
                            },
                            icon: const Icon(Icons.update))
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Winners of Final:",
                      style: kSportSmallHeading,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: "Final Winner",
                            textEditingController: fController,
                            isRichInput: false,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              _updateWinner(fController, "f");
                            },
                            icon: const Icon(Icons.update))
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: SizedBox(
                    //     width: 220,
                    //     child: MainButton(
                    //       text: "Update",
                    //       onPress: () {},
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                  ],
                ),
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
