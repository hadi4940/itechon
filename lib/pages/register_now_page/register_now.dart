import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as ownResponsiveness;
import 'package:itechone/services/firestore/firestore_methods.dart';
import 'package:itechone/widgets/custom_textfield.dart';
import 'package:itechone/widgets/icon_text_button.dart';
import 'package:itechone/widgets/main_button.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:image_picker_web/image_picker_web.dart';

class RegisterNowPage extends StatefulWidget {
  static const String route = '/register';
  const RegisterNowPage({super.key});

  @override
  State<RegisterNowPage> createState() => _RegisterNowPageState();
}

class _RegisterNowPageState extends State<RegisterNowPage> {
  //Image? image1;
  Uint8List? image1;

  TextEditingController nameOfTeamController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController challanNoController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();

  // TextEditingController messageController = TextEditingController();
  int selectedOption = 1;
  // Initial Selected Value
  String event = 'Badminton';

  // List of items in our dropdown menu
  var dropdownEvents = [
    'Badminton',
    'Table Tanis',
    'Snooker',
    'Cricket',
    'Futsal',
  ];

  // validation
  String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  String phonePattern = r'^03\d{9}$';

  Future<void> pickImage() async {
    image1 = await ImagePickerWeb.getImageAsBytes();
    setState(() {});
  }

  bool isLoading = false;

  void _addPost(
    String studentName,
    String nameOfTeam,
    String studentID,
    String email,
    String semester,
    String contactNo,
    String challanReceiptNo,
    Uint8List file,
  ) async {
    if (studentName == "" ||
        email == "" ||
        studentID == "" ||
        semester == "" ||
        contactNo == "") {
      Fluttertoast.showToast(
          msg: "Please enter all fields",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }
    // Student name validation
    RegExp studentNameRegExp = RegExp(r'^[a-zA-Z ]+$');
    if (!studentNameRegExp.hasMatch(studentName)) {
      Fluttertoast.showToast(
          msg: "Please enter a valid student name (only alphabets allowed)",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }
    // Student ID validation
    RegExp studentIDRegExp = RegExp(r'^\d{12}$');
    if (!studentIDRegExp.hasMatch(studentID)) {
      Fluttertoast.showToast(
          msg: "Please enter a valid student ID (12 digits only)",
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
    if (!phoneRegExp.hasMatch(contactNo)) {
      Fluttertoast.showToast(
          msg:
              "Phone should be 11 digit long and start with '03' e.g 03xxxxxxxxx ",
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 2);
      return;
    }

    setState(() {
      isLoading = true;
    });
    try {
      String res = await FirestoreMethods().registerForEvent(
        studentName,
        event,
        studentID,
        email,
        semester,
        contactNo,
        challanReceiptNo,
        file,
        false,
      );
      if (res == 'success') {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
          msg: "Register Successfully!",
        );
        // if (!mounted) return;
        // Navigator.pop(context);
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
          msg: "Error: $res",
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
        msg: "Error: $e",
      );
    }
    nameOfTeamController.text = "";
    studentIDController.text = "";
    emailController.text = "";
    semesterController.text = "";
    contactNoController.text = "";
    challanNoController.text = "";
    image1 = null;
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
                  hintText: "Name of Captain/Team Name",
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
                        nameOfTeamController.text = newValue;
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
              // radio button
              ResponsiveGridCol(
                lg: 6,
                md: 6,
                sm: 12,
                child: ListTile(
                  title: const Text('Team Registration'),
                  leading: Radio(
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          image1 == null
              ? Center(
                  child: Image.asset(
                  "assets/images/plus.png",
                  height: 200,
                  width: 200,
                ))
              : Center(
                  child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: MemoryImage(
                              image1!,
                            ),
                            fit: BoxFit.contain),
                      )),
                ),
          const SizedBox(
            height: 15,
          ),
          screenWidth > 566
              ? Row(
                  children: [
                    IconTextButton(
                      onPress: () {
                        pickImage();
                      },
                    ),
                    /*IconTextButton(
                      onPress: () {},
                    ),*/
                  ],
                )
              : Column(
                  children: [
                    IconTextButton(
                      onPress: () {},
                    ),
                    IconTextButton(
                      onPress: () {},
                    ),
                  ],
                ),
          const SizedBox(
            height: 10,
          ),
          !isLoading
              ? SizedBox(
                  width: 220,
                  child: MainButton(
                    text: "Register",
                    onPress: () {
                      if (studentIDController.text == "") {
                        Fluttertoast.showToast(
                          msg: "Please Enter student ID",
                        );
                        return;
                      }
                      if (image1 == null) {
                        Fluttertoast.showToast(
                          msg: "Please add an challan image",
                        );
                        return;
                      }
                      _addPost(
                        studentNameController.text,
                        nameOfTeamController.text,
                        studentIDController.text,
                        emailController.text,
                        semesterController.text,
                        contactNoController.text,
                        challanNoController.text,
                        image1!,
                      );
                    },
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );

    // download challan
    const downloadChallan = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Register Now",
          style: TextStyle(
              fontSize: 36, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ],
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
                    height: screenHeight * 1.5,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                          width: screenWidth,
                          height: MediaQuery.of(context).size.height,
                          child: Image.asset(
                            "assets/images/register.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        screenWidth > 772
                            ? const Positioned(
                                left: 50,
                                top: 165,
                                child: downloadChallan,
                              )
                            : const Positioned(
                                left: 20,
                                top: 65,
                                child: downloadChallan,
                              ),
                        screenWidth > 772
                            ? Positioned(
                                right: 20,
                                // if small screen add this letter to make it responsive
                                //  left: 20,
                                bottom: -20,
                                child: form,
                              )
                            : Positioned(
                                right: 10,
                                // if small screen add this letter to make it responsive
                                left: 5,
                                bottom: -80,
                                child: form,
                              ),
                      ],
                    ),
                  ),
                  const NavBar(
                    color: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              // rest
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
