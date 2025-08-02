import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:itechone/admin/admin_components/admin_navbar.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as own_responsive_widget;
import 'package:itechone/services/firestore/firestore_methods.dart';
import 'package:itechone/widgets/main_button.dart';

class DownloadPageAdmin extends StatefulWidget {
  static const String route = '/download_admin';

  const DownloadPageAdmin({super.key});

  @override
  State<DownloadPageAdmin> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPageAdmin> {
  // Initial Selected Value
  String dropdownYear = '2022';

  // List of items in our dropdown menu
  var dropdownList = [
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
  ];
  Uint8List? bsPosterTempleteImage;
  Uint8List? previousITECONReport;
  Uint8List? winnerList;

  void uploadDownloadable(String name, Uint8List image) async {
    Fluttertoast.showToast(
      msg: "Uploading, Please Wait",
      timeInSecForIosWeb: 2,
    );
    try {
      String res = await FirestoreMethods().addPoster(
        name,
        image,
      );
      if (res == 'success') {
        Fluttertoast.showToast(
          msg: "Uploaded Successfully!",
        );
      } else {
        Fluttertoast.showToast(
          msg: "Error: $res",
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error: $e",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final dropdrowButton = DropdownButton(
      value: dropdownYear,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: dropdownList.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownYear = newValue!;
        });
      },
    );
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
              const AdminNavBar(color: Color(0x600E356B)),
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
                "Upload",
                style: kMainHeadingStyle,
              ),
              SizedBox(
                width: screenWidth * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Poster Templates",
                      style: kSportSmallHeading,
                    ),
                    MainButton(
                        text: "Select",
                        onPress: () async {
                          bsPosterTempleteImage =
                              await ImagePickerWeb.getImageAsBytes();
                          winnerList = null;
                          previousITECONReport = null;
                          setState(() {});
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: screenWidth * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Previous ITECON Report",
                      style: kSportSmallHeading,
                    ),
                    MainButton(
                        text: "Select",
                        onPress: () async {
                          previousITECONReport =
                              await ImagePickerWeb.getImageAsBytes();
                          bsPosterTempleteImage = null;
                          winnerList = null;

                          setState(() {});
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: screenWidth * 0.65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Winner lists of",
                      style: kSportSmallHeading,
                    ),
                    dropdrowButton,
                    MainButton(
                        text: "Select",
                        onPress: () async {
                          winnerList = await ImagePickerWeb.getImageAsBytes();
                          bsPosterTempleteImage = null;
                          previousITECONReport = null;
                          setState(() {});
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              bsPosterTempleteImage != null
                  ? Column(
                      children: [
                        Container(
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(
                                    bsPosterTempleteImage!,
                                  ),
                                  fit: BoxFit.contain),
                            )),
                        MainButton(
                          text: "Upload",
                          onPress: () async {
                            uploadDownloadable(
                              "bsPosterTempleteImage",
                              bsPosterTempleteImage!,
                            );
                          },
                        )
                      ],
                    )
                  : const SizedBox(),
              previousITECONReport != null
                  ? Column(
                      children: [
                        Container(
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(
                                    previousITECONReport!,
                                  ),
                                  fit: BoxFit.contain),
                            )),
                        MainButton(
                            text: "Upload",
                            onPress: () async {
                              uploadDownloadable(
                                "previousITECONReport",
                                previousITECONReport!,
                              );
                            })
                      ],
                    )
                  : const SizedBox(),
              winnerList != null
                  ? Column(
                      children: [
                        Container(
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: MemoryImage(
                                    winnerList!,
                                  ),
                                  fit: BoxFit.contain),
                            )),
                        MainButton(
                            text: "Upload",
                            onPress: () async {
                              uploadDownloadable(
                                "winnerList$dropdownYear",
                                winnerList!,
                              );
                            })
                      ],
                    )
                  : const SizedBox(),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
