import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_sender/email_sender.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/admin/admin_components/admin_navbar.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as ownResponsiveWidget;
import 'package:uuid/uuid.dart';

class AdminTickets extends StatelessWidget {
  static const String route = '/admin_tickets';

  AdminTickets({super.key});
  final CollectionReference _tickets =
      FirebaseFirestore.instance.collection("tickets");

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: !ownResponsiveWidget.ResponsiveWidget.isLargeScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: !ownResponsiveWidget.ResponsiveWidget.isLargeScreen(context)
          ? const DrawerForMobile()
          : null,
      body: SingleChildScrollView(
        child: ownResponsiveWidget.ResponsiveWidget(
          largeScreen: Column(
            children: [
              Stack(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: screenWidth,
                        height: screenHeight * 0.8,
                        child: Image.asset(
                          "assets/images/event_banner.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            "Accept or Reject Tickets",
                            style: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 50,
                          )
                        ],
                      )
                    ],
                  ),
                  const AdminNavBar(
                    color: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              StreamBuilder(
                stream: _tickets.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  return DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Match')),
                      DataColumn(label: Text('Sem')),
                      DataColumn(label: Text('Challan')),
                      DataColumn(label: Text('Whatsapp')),
                      DataColumn(
                          label: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(Icons.cancel),
                      )),
                      DataColumn(
                          label: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Icon(Icons.done),
                      )),
                    ],
                    rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return DataRow(
                        cells: [
                          DataCell(Text(data['studentName'].toString())),
                          DataCell(Text(data['email'].toString())),
                          DataCell(Text(data['nameOfTeam'].toString())),
                          DataCell(Text(data['semester'].toString())),
                          DataCell(Text(data['challanReceiptNo'].toString())),
                          DataCell(Text(data['contactNo'].toString())),
                          DataCell(IconButton(
                            onPressed: () async {
                              await _tickets.doc(document.id).delete();
                            },
                            icon: const Icon(Icons.cancel),
                          )),
                          DataCell(IconButton(
                            onPressed: () async {
                              String id = const Uuid().v1();
                              // send email
                              EmailSender emailsender = EmailSender();
                              var response = await emailsender.sendMessage(
                                data['email'].toString(),
                                "Ticket",
                                "ITechon entry pass for ${data['nameOfTeam'].toString()}",
                                "This is your Entry Pass for the event/concert \n Please bring your mobile with this email for verification \n Name: ${data['studentName'].toString()} \n Semester: ${data['semester'].toString()} \n Unique Identifier: $id",
                              );
                              Fluttertoast.showToast(
                                  msg:
                                      "Email with ticket send \n Detail: ${response.toString()}");

                              await _tickets.doc(document.id).delete();
                            },
                            icon: const Icon(Icons.done),
                          )),
                        ],
                      );
                    }).toList(),
                  );
                },
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
