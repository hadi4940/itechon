import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itechone/admin/admin_components/admin_navbar.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as ownResponsiveWidget;

class ManagementPageAdmin extends StatelessWidget {
  static const String route = '/admin_management';

  ManagementPageAdmin({super.key});
  final CollectionReference _managementTeam =
      FirebaseFirestore.instance.collection("management_team");
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _teamNameController = TextEditingController();
  // final TextEditingController _semesterController = TextEditingController();
  // final TextEditingController _whatsappController = TextEditingController();

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
                            "Management Team",
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
                stream: _managementTeam.snapshots(),
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
                      DataColumn(label: Text('Team Name')),
                      DataColumn(label: Text('Semester')),
                      DataColumn(label: Text('Whatsapp')),
                      DataColumn(label: Text('Delete')),

                      // Add more DataColumn widgets for each field you want to display
                    ],
                    rows: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;
                      return DataRow(
                        cells: [
                          DataCell(Text(data['name'].toString())),
                          DataCell(Text(data['email'].toString())),
                          DataCell(Text(data['team_name'].toString())),
                          DataCell(Text(data['semester'].toString())),
                          DataCell(Text(data['whatsapp'].toString())),
                          DataCell(IconButton(
                            onPressed: () async {
                              await _managementTeam.doc(document.id).delete();
                            },
                            icon: const Icon(Icons.delete),
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
