import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as ownResponsiveness;
import 'package:itechone/widgets/custom_textfield.dart';
import 'package:itechone/widgets/main_button.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ManagementRegisteration extends StatefulWidget {
  static const String route = '/management_registeration';

  ManagementRegisteration({super.key});

  @override
  State<ManagementRegisteration> createState() =>
      _ManagementRegisterationState();
}

class _ManagementRegisterationState extends State<ManagementRegisteration> {
  final CollectionReference _managementTeam =
      FirebaseFirestore.instance.collection("management_team");

  final TextEditingController nameController = TextEditingController();

  final TextEditingController teamNameController = TextEditingController();

  final TextEditingController studentIDController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController semesterController = TextEditingController();

  final TextEditingController contactNoController = TextEditingController();

  String event = 'Finance Team';

  // List of items in our dropdown menu
  var dropdownEvents = [
    'Finance Team',
    'Security Team',
    'Media Team',
    'Logistic Team',
    'Art and Decore Team',
  ];
  var semester = '1';

  // List of items in our dropdown menu
  /*var dropdownSemester = [
    '1',
    '2',
    '3',
    '4',
    ' 5'
        '6',
    '7',
    '8',
    '9',
    '10',
    ' 11'
        '12',
  ];*/
  // validation
  String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  String phonePattern = r'^03\d{9}$';

  // ADDING
  Future<void> _addMember(BuildContext context) async {
    final String name = nameController.text;
    final String email = emailController.text;
    final String teamName = event;
    final String semester = semesterController.text;
    final String whatsapp = contactNoController.text;

    if (name == "" ||
        email == "" ||
        teamName == "" ||
        semester == "" ||
        whatsapp == "") {
      Fluttertoast.showToast(
          msg: "Please enter all fields",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }
    // Student name validation
    RegExp studentNameRegExp = RegExp(r'^[a-zA-Z ]+$');
    if (!studentNameRegExp.hasMatch(name)) {
      Fluttertoast.showToast(
          msg: "Please enter a valid student name (only alphabets allowed)",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }
    // Student ID validation
    //RegExp studentIDRegExp = RegExp(r'^\d{12}$');
    //if (!studentIDRegExp.hasMatch(name)) {
    //Fluttertoast.showToast(
    //  msg: "Please enter a valid student ID (12 digits only)",
    //gravity: ToastGravity.TOP,
    //timeInSecForIosWeb: 2);
    //return;
    //}
    // email validation
    RegExp emailRegExp = RegExp(emailPattern);
    if (!emailRegExp.hasMatch(email)) {
      Fluttertoast.showToast(
          msg: "Please enter correct email",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }

// Semester validation
    int? semesterValue = int.tryParse(semesterController.text);
    if (semesterValue == null || semesterValue < 1 || semesterValue > 12) {
      Fluttertoast.showToast(
          msg: "Please enter a valid semester (between 1 and 12)",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }
    // Phone Varification
    RegExp phoneRegExp = RegExp(phonePattern);
    if (!phoneRegExp.hasMatch(whatsapp)) {
      Fluttertoast.showToast(
          msg:
              "Phone should be 11 digit long and start with '03' e.g 03xxxxxxxxx ",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }

    try {
      await _managementTeam.add({
        "name": name,
        "email": email,
        "team_name": teamName,
        "semester": semester,
        "whatsapp": whatsapp
      });
      nameController.text = "";
      emailController.text = "";
      teamNameController.text = "";
      semesterController.text = "";
      contactNoController.text = "";
      studentIDController.text = "";
      Fluttertoast.showToast(msg: "Member Added Successfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error While adding, $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final form = Container(
      decoration: BoxDecoration(
        boxShadow: const [kBoxShadow],
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(25),
      width: 650,
      //height: screenWidth > 772 ? 550 : 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveGridRow(
            children: [
              // Team 1
              ResponsiveGridCol(
                lg: 6,
                md: 6,
                sm: 12,
                child: CustomTextField(
                    textEditingController: nameController,
                    hintText: "Name",
                    isRichInput: false),
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
                child: DropdownButton(
                  style: const TextStyle(
                      fontSize: 16, color: Color.fromARGB(166, 14, 13, 13)),
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
                      teamNameController.text = event;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
              child: MainButton(
                  text: "Register",
                  onPress: () {
                    _addMember(context);
                  }))
        ],
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ownResponsiveness.ResponsiveWidget.isMediumScreen(context) ||
              ownResponsiveness.ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: ownResponsiveness.ResponsiveWidget.isMediumScreen(context) ||
              ownResponsiveness.ResponsiveWidget.isSmallScreen(context)
          ? const DrawerForMobile()
          : null,
      body: SingleChildScrollView(
        child: ownResponsiveness.ResponsiveWidget(
          largeScreen: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: screenHeight * 0.8,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: screenWidth,
                          height: MediaQuery.of(context).size.height,
                          child: Image.asset(
                            "assets/images/register.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          "Register As volunteer",
                          style:
                              kMainHeadingStyle.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const NavBar(
                    color: kNavBarColor1,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              // rest
              form,
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
