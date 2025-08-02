import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as own_responsive_widget;
import 'package:itechone/services/firestore/firestore_methods.dart';
import 'package:itechone/widgets/custom_textfield.dart';
import 'package:itechone/widgets/main_button.dart';
import 'package:responsive_grid/responsive_grid.dart';

class BookTicketPage extends StatefulWidget {
  static const String route = '/bookTicket';

  const BookTicketPage({super.key});

  @override
  State<BookTicketPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<BookTicketPage> {
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
    "Poster Competition",
    "Workshop",
    "Seminars",
    "Pitch Startup Idea",
    "Mini Market"
        "Art",
    "Music",
    "Poetry",
    "Darama",
    "Debats",
    "Literature",
  ];
  TextEditingController nameOfTeamController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();

  TextEditingController challanNoController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  // validation
  String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  String phonePattern = r'^03\d{9}$';

  void _bookTicket(
    String name,
    String nameOfTeam,
    String studentID,
    String email,
    String semester,
    String contactNo,
    String challanReceiptNo,
  ) async {
    if (name == "" ||
        email == "" ||
        studentID == "" ||
        semester == "" ||
        contactNo == "") {
      Fluttertoast.showToast(
          msg: "Please enter all fields,",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }
    // email validation
    RegExp emailRegExp = RegExp(emailPattern);
    if (!emailRegExp.hasMatch(email)) {
      Fluttertoast.showToast(
          msg: "Please enter correct email",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }

    // Phone Varification
    RegExp phoneRegExp = RegExp(phonePattern);
    if (!phoneRegExp.hasMatch(contactNo)) {
      Fluttertoast.showToast(
          msg:
              "Phone should be 11 digit long and start with '03' e.g 03xxxxxxxxx ",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }

    // Fluttertoast.showToast(
    //     msg: "Requesting, Please wait", timeInSecForIosWeb: 2);
    try {
      String res = await FirestoreMethods().bookTicket(
        name,
        event,
        studentID,
        email,
        semester,
        contactNo,
        challanReceiptNo,
      );
      if (res == 'success') {
        Fluttertoast.showToast(
          msg:
              "Register successfully, when admin accept your payment, you will be notify through provided email",
          timeInSecForIosWeb: 3,
        );

        // if (!mounted) return;
        // Navigator.pop(context);
      } else {
        // setState(() {
        //   isLoading = false;
        // });
        Fluttertoast.showToast(
          msg: "Not registered, Please try later, Error: $res",
        );
      }
    } catch (e) {
      // setState(() {
      //   isLoading = false;
      // });
      Fluttertoast.showToast(
        msg: "Not registered, Please try later, Error: $e",
      );
    }
    studentNameController.text = "";
    nameOfTeamController.text = "";
    studentIDController.text = "";
    emailController.text = "";
    semesterController.text = "";
    contactNoController.text = "";
    challanNoController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: own_responsive_widget.ResponsiveWidget.isMediumScreen(context) ||
              own_responsive_widget.ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: own_responsive_widget.ResponsiveWidget.isMediumScreen(context) ||
              own_responsive_widget.ResponsiveWidget.isSmallScreen(context)
          ? const DrawerForMobile()
          : null,
      body: SingleChildScrollView(
        child: own_responsive_widget.ResponsiveWidget(
          largeScreen: Column(
            children: [
              const NavBar(color: Color(0x600E356B)),
              Image.asset(
                "assets/images/download_banner.png",
                fit: BoxFit.cover,
                height: screenHeight * 0.5,
                width: screenWidth,
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              const Text(
                "Book Your Ticket here",
                style: kMainHeadingStyle,
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [kBoxShadow],
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.all(25),
                width: 650,
                height: screenWidth > 772 ? 600 : 850,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveGridRow(
                      children: [
                        ResponsiveGridCol(
                          lg: 6,
                          md: 6,
                          sm: 12,
                          child: CustomTextField(
                            textEditingController: studentNameController,
                            hintText: "Name",
                            isRichInput: false,
                          ),
                        ),
                        // Team 1
                        ResponsiveGridCol(
                          lg: 6,
                          md: 6,
                          sm: 12,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DropdownButton(
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
                          ),
                        ),
                        // 2
                        ResponsiveGridCol(
                          lg: 6,
                          md: 6,
                          sm: 12,
                          child: CustomTextField(
                            textEditingController: studentIDController,
                            hintText: "Student ID",
                            isRichInput: false,
                          ),
                        ),
                        // Team 3
                        ResponsiveGridCol(
                          lg: 6,
                          md: 6,
                          sm: 12,
                          child: CustomTextField(
                            textEditingController: emailController,
                            hintText: "Email address",
                            isRichInput: false,
                          ),
                        ),
                        // Team 4
                        ResponsiveGridCol(
                          lg: 6,
                          md: 6,
                          sm: 12,
                          child: CustomTextField(
                            textEditingController: semesterController,
                            hintText: "Semester",
                            isRichInput: false,
                          ),
                        ),
                        // Team 5
                        ResponsiveGridCol(
                          lg: 6,
                          md: 6,
                          sm: 12,
                          child: CustomTextField(
                            textEditingController: contactNoController,
                            hintText: "Contact no.",
                            isRichInput: false,
                          ),
                        ),
                        // Team 6
                        ResponsiveGridCol(
                          lg: 6,
                          md: 6,
                          sm: 12,
                          child: CustomTextField(
                            textEditingController: challanNoController,
                            hintText: "Challan receipt number",
                            isRichInput: false,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Note: When Admin Accept your payment, your ticket will be automatically send to your provided email",
                      style: TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: MainButton(
                          text: "Send",
                          onPress: () {
                            _bookTicket(
                              studentNameController.text,
                              event,
                              studentIDController.text,
                              emailController.text,
                              semesterController.text,
                              contactNoController.text,
                              challanNoController.text,
                            );
                          }),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
