import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:itechone/admin/admin_components/admin_navbar.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/gallery_page/widgets/single_image.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/services/firestore/firestore_methods.dart';
import 'package:itechone/widgets/custom_textfield.dart';
import 'package:itechone/widgets/main_button.dart';

class AdminaGallery extends StatefulWidget {
  static const String route = '/admin_gallery';

  const AdminaGallery({super.key});

  @override
  State<AdminaGallery> createState() => _AminaGalleryState();
}

class _AminaGalleryState extends State<AdminaGallery> {
  final CollectionReference _galleryColection =
      FirebaseFirestore.instance.collection("galleryCollection");
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();
  Uint8List? imageToAdd;
  void uploadImageToGallery() async {
    if (eventNameController.text == "" ||
        eventLocationController.text == "" ||
        eventDateController.text == "" ||
        imageToAdd == null) {
      Fluttertoast.showToast(
        msg: "Please Complete The form",
        timeInSecForIosWeb: 2,
      );
      return;
    }
    Fluttertoast.showToast(
      msg: "Uploading, Please Wait",
      timeInSecForIosWeb: 2,
    );
    try {
      String res = await FirestoreMethods().addGalleryImageAndData(
        eventNameController.text,
        eventLocationController.text,
        eventDateController.text,
        imageToAdd!,
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
    Fluttertoast.showToast(
      msg: "Adding Image, it may take a while",
    );
    eventNameController.text == "";
    eventLocationController.text == "";
    eventDateController.text == "";
    imageToAdd == null;
    setState(() {});
  }

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
                "assets/images/gallery_4.png",
                fit: BoxFit.cover,
                height: screenHeight * 0.6,
                width: screenWidth,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 35, horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Update Gallery",
                      style: kMainHeadingStyle,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                        hintText: "Name",
                        textEditingController: eventNameController,
                        isRichInput: false),
                    CustomTextField(
                        hintText: "Date",
                        textEditingController: eventDateController,
                        isRichInput: false),
                    CustomTextField(
                        hintText: "Location",
                        textEditingController: eventLocationController,
                        isRichInput: false),
                    MainButton(
                        text: "Add image",
                        onPress: () async {
                          imageToAdd = await ImagePickerWeb.getImageAsBytes();
                          setState(() {});
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    imageToAdd != null
                        ? Column(
                            children: [
                              Container(
                                  height: 200,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: MemoryImage(
                                        imageToAdd!,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              MainButton(
                                  text: "Add",
                                  onPress: () {
                                    uploadImageToGallery();
                                  })
                            ],
                          )
                        : const SizedBox(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Delete Images",
                      style: kMainHeadingStyle,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    StreamBuilder(
                      stream: _galleryColection.snapshots(),
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
                        return SizedBox(
                          height: screenHeight,
                          child: GridView.builder(
                            itemCount: snapshot.data!.docs.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              final data = snapshot.data!.docs[index];

                              return SingleImage(
                                imagePath: data['imageURL'],
                                name: data['event_name'],
                                location: data['event_location'],
                                date: data['event_date'],
                                isShowDeleteButton: true,
                                onDeletePress: () {
                                  _galleryColection.doc(data.id).delete();
                                },
                              );
                              //return Text("$data");
                            },
                          ),
                        );

                        //
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
