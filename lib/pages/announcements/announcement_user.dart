import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/pages/announcements/widgets/announcement_card.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as ownResponsiveWidget;

class AnnouncementUsers extends StatelessWidget {
  AnnouncementUsers({super.key});
  static const String route = '/announcement_user';

  final CollectionReference _announcement =
      FirebaseFirestore.instance.collection("announcements");

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ownResponsiveWidget.ResponsiveWidget.isMediumScreen(context) ||
              ownResponsiveWidget.ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: ownResponsiveWidget.ResponsiveWidget.isMediumScreen(context) ||
              ownResponsiveWidget.ResponsiveWidget.isSmallScreen(context)
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
                            "ANNOUNCEMENTS",
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
                  const NavBar(
                    color: Colors.transparent,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.08),
                child: StreamBuilder(
                  stream: _announcement.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    return SizedBox(
                      height: screenHeight,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final singleAnnouncement = snapshot.data!.docs[index];
                          return AnnouncementCard(
                            messageBy: singleAnnouncement["messageBy"],
                            message: singleAnnouncement["message"],
                            date: (singleAnnouncement["date"] as Timestamp)
                                .toDate(),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
