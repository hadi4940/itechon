import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/admin/admin_components/admin_navbar.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as ownResponsiveWidget;
import 'package:itechone/widgets/custom_textfield.dart';
import 'package:itechone/widgets/main_button.dart';

class AdminAnnouncementsPage extends StatelessWidget {
  static const String route = '/admin_announcement';
  final TextEditingController messageByController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final CollectionReference _announcement =
      FirebaseFirestore.instance.collection("announcements");
  AdminAnnouncementsPage({super.key});

  _addAnnouncement() async {
    final String meaasgeBy = messageByController.text;
    final String message = messageController.text;

    try {
      await _announcement.add({
        "messageBy": meaasgeBy,
        "date": DateTime.now(),
        "message": message,
      });
      messageByController.text = "";
      messageController.text = "";
      Fluttertoast.showToast(msg: "Announcement Added Successfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error While adding, $e");
    }
  }

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
                  const AdminNavBar(
                    color: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              const Text(
                "Make an ANNOUNCEMENTS",
                style: kMainHeadingStyle,
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.08),
                child: Column(
                  children: [
                    CustomTextField(
                        hintText: "Message by",
                        textEditingController: messageByController,
                        isRichInput: false),
                    CustomTextField(
                        hintText: "Message",
                        textEditingController: messageController,
                        isRichInput: true),
                    MainButton(
                        text: "ADD",
                        onPress: () {
                          _addAnnouncement();
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
