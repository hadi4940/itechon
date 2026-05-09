import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/register_now_page/register_now.dart';
import 'package:itechone/pages/register_now_page_solo/register_now_solo.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/widgets/main_button.dart';
import 'package:itechone/pages/download_page/download_page.dart';

import '../../services/firestore/firestore_methods.dart';

class SingleSportPage extends StatelessWidget {
  final String imagePath;
  final String sportName;
  final String registerTeamOrSolo;
  final String description;
  final String venue;
  final String date;
  final bool showWinners;

  const SingleSportPage({
    super.key,
    required this.sportName,
    required this.description,
    required this.imagePath,
    required this.venue,
    required this.date,
    required this.registerTeamOrSolo,
    required this.showWinners,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final name = Text(
      sportName,
      style: kMainHeadingStyle,
    );
    final register = Text(
      "($registerTeamOrSolo)",
      style: const TextStyle(
        fontSize: 30,
        color: kSecondardColor,
      ),
    );
    final CollectionReference _events =
        FirebaseFirestore.instance.collection("events_winner_update");
    final CollectionReference _register_student =
        FirebaseFirestore.instance.collection("register_student");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isSmallScreen(context)
          ? const DrawerForMobile()
          : null,
      body: ResponsiveWidget(
        largeScreen: SingleChildScrollView(
          child: Column(
            children: [
              const NavBar(
                color: Color(0x600E356B),
              ),
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: screenHeight * 0.85,
                width: screenWidth,
              ),
              StreamBuilder(
                  stream: _events.doc(sportName).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // 1. Check if the document actually exists in Firestore
                    if (!snapshot.hasData || !snapshot.data!.exists) {
                      // Trigger auto-creation if it doesn't exist
                      _events.doc(sportName).set(FirestoreMethods.defaultWinnerSchema);

                      return const Center(child: Text("Initializing match brackets..."));
                    }

                    // 2. Cast data to a Map for safe access
                    final data = snapshot.data!.data() as Map<String, dynamic>;

                    // 3. Helper function to get values or return a default string
                    String getVal(String key) => data.containsKey(key) ? data[key].toString() : "TBD";
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 35, horizontal: screenWidth * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          screenWidth > 530
                              ? Row(
                                  children: [
                                    name,
                                    register,
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    name,
                                    register,
                                  ],
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            description,
                            style: const TextStyle(
                              color: kTextColor,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Venue:",
                            style: kSportSmallHeading,
                          ),
                          Text(venue),
                          Text(date),
                          const SizedBox(
                            height: 15,
                          ),
                          // const Align(
                          //   alignment: Alignment.center,
                          //   child: Text(
                          //     "Registered Teams",
                          //     style: kSportSmallHeading,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 15,
                          // ),
                          // screenWidth > 505
                          //     ? Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Text(
                          //             "Team A",
                          //             style: kSportSmallHeading.copyWith(
                          //                 color: kSecondardColor),
                          //           ),
                          //           Text(
                          //             "Team B",
                          //             style: kSportSmallHeading.copyWith(
                          //                 color: kSecondardColor),
                          //           ),
                          //           Text(
                          //             "Team C",
                          //             style: kSportSmallHeading.copyWith(
                          //                 color: kSecondardColor),
                          //           ),
                          //         ],
                          //       )
                          //     : Column(
                          //         children: [
                          //           Text(
                          //             "Team A",
                          //             style: kSportSmallHeading.copyWith(
                          //                 color: kSecondardColor),
                          //           ),
                          //           Text(
                          //             "Team B",
                          //             style: kSportSmallHeading.copyWith(
                          //                 color: kSecondardColor),
                          //           ),
                          //           Text(
                          //             "Team C",
                          //             style: kSportSmallHeading.copyWith(
                          //                 color: kSecondardColor),
                          //           ),
                          //         ],
                          //       ),
                          const SizedBox(
                            height: 25,
                          ),
                          showWinners
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
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
                                    screenWidth > 505
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text("1st match \n${getVal('qf1')}", style: kSportTeamHeading),
                                              Text("2nd match \n${getVal('qf2')}", style: kSportTeamHeading),
                                              Text(
                                                "3rd match \n${getVal('qf3')}",
                                                style: kSportTeamHeading,
                                              ),
                                              Text(
                                                "4th match \n${getVal('qf4')}",
                                                style: kSportTeamHeading,
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Text(
                                                "1st match  \n${snapshot.data!['qf1']}",
                                                style: kSportTeamHeading,
                                              ),
                                              Text(
                                                "2nd match  \n${snapshot.data!['qf2']}",
                                                style: kSportTeamHeading,
                                              ),
                                              Text(
                                                "3rd match  \n${snapshot.data!['qf3']}",
                                                style: kSportTeamHeading,
                                              ),
                                              Text(
                                                "4th match  \n${snapshot.data!['qf4']}",
                                                style: kSportTeamHeading,
                                              ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "1st match \n${snapshot.data!['sf1']}",
                                          style: kSportTeamHeading,
                                        ),
                                        Text(
                                          "2nd match \n${snapshot.data!['sf2']}",
                                          style: kSportTeamHeading,
                                        ),
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
                                    Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${snapshot.data!['f']}",
                                        style: kSportSmallHeading.copyWith(
                                            color: kSecondardColor),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 220,
                                        child: MainButton(
                                          text: "Register Now As a Team",
                                          onPress: () {
                                            Navigator.pushNamed(
                                                context, RegisterNowPage.route);
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: TextButton(
                                        child: const Text(
                                          "Download",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, DownloadPage.route);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    StreamBuilder(
                                      stream: _register_student
                                          .where("name", isEqualTo: sportName)
                                          .snapshots(),
                                      builder: (context,
                                          AsyncSnapshot<QuerySnapshot>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        if (snapshot.hasError) {
                                          return Center(
                                              child: Text(
                                                  'Error: ${snapshot.error}'));
                                        }
                                        return DataTable(
                                          columns: const [
                                            DataColumn(label: Text('Name')),
                                            DataColumn(label: Text('Email')),
                                            DataColumn(
                                                label: Text('Contact No')),
                                            DataColumn(label: Text('Semester')),

                                            DataColumn(
                                                label: Text('studentID')),

                                            // Add more DataColumn widgets for each field you want to display
                                          ],
                                          rows: snapshot.data!.docs
                                              .map((DocumentSnapshot document) {
                                            Map<String, dynamic> data = document
                                                .data() as Map<String, dynamic>;
                                            return DataRow(
                                              cells: [
                                                DataCell(Text(
                                                    data['name'].toString())),
                                                DataCell(Text(
                                                    data['email'].toString())),
                                                DataCell(Text(data['contactNo']
                                                    .toString())),
                                                DataCell(Text(data['semester']
                                                    .toString())),
                                                DataCell(Text(data['studentID']
                                                    .toString())),
                                              ],
                                            );
                                          }).toList(),
                                        );
                                      },
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: 220,
                                        child: MainButton(
                                          text: "Register Now As Solo",
                                          onPress: () {
                                            Navigator.pushNamed(context,
                                                RegisterNowPageSolo.route);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    );
                  }),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
