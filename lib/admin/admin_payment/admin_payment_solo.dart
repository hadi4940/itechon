import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itechone/admin/admin_components/admin_navbar.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart';

class AdminPaymentSolo extends StatelessWidget {
  static const String route = '/admin_payment_solo';
  final TextEditingController selectTournamentController =
      TextEditingController();
  final TextEditingController totalParticipentController =
      TextEditingController();
  final CollectionReference _register_student =
      FirebaseFirestore.instance.collection("register_student");

  AdminPaymentSolo({super.key});

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
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Payments Accepted (Solo Registration)",
                      style: kMainHeadingStyle,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    StreamBuilder(
                      stream: _register_student
                          .where("status", isEqualTo: true)
                          .where("isSolo", isEqualTo: true)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }
                        return DataTable(
                          columns: const [
                            DataColumn(label: Text('Name Of Student')),
                            DataColumn(label: Text('Participate in')),
                            DataColumn(label: Text('Email')),
                            DataColumn(label: Text('Contact No')),
                            DataColumn(label: Text('Semester')),
                            //DataColumn(label: Text('challanReceiptNo')),
                            // DataColumn(label: Text('studentID')),
                            DataColumn(label: Text('Payment')),
                            DataColumn(label: Text('Delete')),

                            // Add more DataColumn widgets for each field you want to display
                          ],
                          rows: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data() as Map<String, dynamic>;
                            return DataRow(
                              cells: [
                                DataCell(Text(data['studentName'].toString())),
                                DataCell(Text(data['nameOfTeam'].toString())),
                                DataCell(Text(data['email'].toString())),
                                DataCell(Text(data['contactNo'].toString())),
                                DataCell(Text(data['semester'].toString())),
                                // DataCell(
                                //     Text(data['challanReceiptNo'].toString())),
                                //DataCell(Text(data['studentID'].toString())),
                                DataCell(Text(data['status'].toString())),
                                DataCell(IconButton(
                                  onPressed: () async {
                                    await _register_student
                                        .doc(document.id)
                                        .delete();
                                  },
                                  icon: const Icon(Icons.delete),
                                )),
                              ],
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 35,
                    ),
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
