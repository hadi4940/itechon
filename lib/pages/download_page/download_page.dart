import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/responsive/responsive_widget.dart'
    as own_responsive_widget;
import 'package:itechone/widgets/main_button.dart';

class DownloadPage extends StatefulWidget {
  static const String route = '/download';

  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  String dropdownYear = '2022';

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

  Future<void> _downloadImage(String name) async {
    Fluttertoast.showToast(
      msg: "Downloading, Please wait",
      timeInSecForIosWeb: 2,
    );
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("downloadable_items")
          .doc(name)
          .get();

      if (docSnapshot.exists) {
        var imageLink = docSnapshot.get('imageLink');

        await WebImageDownloader.downloadImageFromWeb(imageLink);
      } else {
        Fluttertoast.showToast(
          msg: "Item Does not exit",
          timeInSecForIosWeb: 2,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Connection Timeout $e",
        timeInSecForIosWeb: 2,
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
                "Downloads",
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
                        text: "Download",
                        onPress: () {
                          _downloadImage("bsPosterTempleteImage");
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
                        text: "Download",
                        onPress: () {
                          _downloadImage("previousITECONReport");
                        })
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
                        text: "Download",
                        onPress: () {
                          _downloadImage("winnerList$dropdownYear");
                        })
                  ],
                ),
              ),
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
