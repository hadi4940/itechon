import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_sender/email_sender.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/admin/admin_components/admin_navbar.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/widgets/main_button.dart';
import 'package:uuid/uuid.dart';

class ShowRegisterStudents extends StatelessWidget {
  static const String route = '/ShowRegisterStudents';
  final TextEditingController selectTournamentController =
      TextEditingController();
  final TextEditingController totalParticipentController =
      TextEditingController();
  final CollectionReference _register_student =
      FirebaseFirestore.instance.collection("register_student");

  ShowRegisterStudents({super.key});

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
                child: StreamBuilder(
                    stream: _register_student.snapshots(),
                    builder:
                        (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return SizedBox(
                          height: screenHeight,
                          child: ListView.builder(
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final singleRegisterStudent =
                                  streamSnapshot.data!.docs[index];
                              return Card(
                                elevation: 6,
                                color: Colors.white,
                                margin: const EdgeInsets.only(bottom: 20),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "Name Of Student: '${singleRegisterStudent["studentName"]}'"),
                                          Text(
                                              "Name Of Team: '${singleRegisterStudent["nameOfTeam"]}'"),
                                          Text(
                                              "Student ID '${singleRegisterStudent["studentID"]}'"),
                                          Text(
                                              "Email '${singleRegisterStudent["email"]}'"),
                                          Text(
                                              "Semester '${singleRegisterStudent["semester"]}'"),
                                          Text(
                                              "Contact no '${singleRegisterStudent["contactNo"]}'"),
                                          Text(
                                              "Challan Number '${singleRegisterStudent["challanReceiptNo"]}'"),
                                        ],
                                      ),
                                      // challan Image
                                      SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: Image.network(
                                          singleRegisterStudent["imageLink"],
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                          errorBuilder:
                                              (context, exception, stackTrace) {
                                            return const Center(
                                                child: Text('Network Error'));
                                          },
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          MainButton(
                                              text: "Accept",
                                              onPress: () async {
                                                await _register_student
                                                    .doc(singleRegisterStudent
                                                        .id)
                                                    .update({
                                                  "status": true,
                                                });
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Marked as Accepted in Database",
                                                    timeInSecForIosWeb: 2);

                                                String id = const Uuid().v1();
                                                // send email
                                                EmailSender emailsender =
                                                    EmailSender();
                                                var response = await emailsender
                                                    .sendMessage(
                                                  singleRegisterStudent["email"]
                                                      .toString(),
                                                  "Ticket",
                                                  "ITechon entry pass for ${singleRegisterStudent["nameOfTeam"]}",
                                                  "This is your Entry Pass for the event/concert \n Please bring your mobile with this email for verification \n Name: ${singleRegisterStudent["studentName"].toString()} \n Semester: ${singleRegisterStudent["semester"]} \n Unique Identifier: $id",
                                                );
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Email with ticket send \n Detail: ${response.toString()}");
                                              }),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          MainButton(
                                              text: "Rejected",
                                              onPress: () async {
                                                await _register_student
                                                    .doc(singleRegisterStudent
                                                        .id)
                                                    .delete();
                                                Fluttertoast.showToast(
                                                    msg: "Rejected",
                                                    timeInSecForIosWeb: 2);
                                              })
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
