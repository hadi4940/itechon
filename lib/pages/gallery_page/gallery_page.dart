import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:itechone/components/drawer.dart';
import 'package:itechone/components/footer.dart';
import 'package:itechone/components/navbar.dart';
import 'package:itechone/pages/gallery_page/widgets/single_image.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/widgets/common_banner.dart';

class GalleryPage extends StatelessWidget {
  static const String route = '/gallery';
  final CollectionReference _galleryColection =
      FirebaseFirestore.instance.collection("galleryCollection");
  GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // List<Widget> gridViewWidgets = [
    //   // const SingleImage(imagePath: "assets/images/gallery_1.png"),
    //   // const SingleImage(imagePath: "assets/images/gallery_2.png"),
    //   // const SingleImage(imagePath: "assets/images/gallery_3.png"),
    //   // const SingleImage(imagePath: "assets/images/gallery_4.png"),
    //   // const SingleImage(imagePath: "assets/images/gallery_5.png"),
    //   // const SingleImage(imagePath: "assets/images/gallery_6.png"),
    //   // const SingleImage(imagePath: "assets/images/gallery_7.png"),
    //   // const SingleImage(imagePath: "assets/images/gallery_8.png"),
    //   // const SingleImage(imagePath: "assets/images/gallery_9.png"),
    //   // const SingleImage(imagePath: "assets/images/gallery_10.png"),
    // ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: ResponsiveWidget.isMediumScreen(context) ||
              ResponsiveWidget.isSmallScreen(context)
          ? const DrawerForMobile()
          : null,
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          largeScreen: Column(
            children: [
              const Stack(
                children: [
                  CommonBanner(
                    imagePath: "assets/images/gallery.png",
                    text: "IIT Gallery",
                  ),
                  NavBar(
                    color: Colors.transparent,
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: StreamBuilder(
                  stream: _galleryColection.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
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
                            isShowDeleteButton: false,
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

                // StaggeredGrid.count(
                //   crossAxisCount: 4,
                //   mainAxisSpacing: 10,
                //   crossAxisSpacing: 10,
                //   children: [
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 2,
                //       mainAxisCellCount: 2,
                //       child: gridViewWidgets[0],
                //     ),
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 2,
                //       mainAxisCellCount: 1,
                //       child: gridViewWidgets[1],
                //     ),
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 1,
                //       mainAxisCellCount: 1,
                //       child: gridViewWidgets[2],
                //     ),
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 1,
                //       mainAxisCellCount: 1,
                //       child: gridViewWidgets[3],
                //     ),
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 2,
                //       mainAxisCellCount: 1,
                //       child: gridViewWidgets[4],
                //     ),
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 2,
                //       mainAxisCellCount: 2,
                //       child: gridViewWidgets[5],
                //     ),
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 2,
                //       mainAxisCellCount: 1,
                //       child: gridViewWidgets[6],
                //     ),
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 4,
                //       mainAxisCellCount: 2,
                //       child: gridViewWidgets[7],
                //     ),
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 1,
                //       mainAxisCellCount: 2,
                //       child: gridViewWidgets[8],
                //     ),
                //     StaggeredGridTile.count(
                //       crossAxisCellCount: 3,
                //       mainAxisCellCount: 2,
                //       child: gridViewWidgets[9],
                //     ),
                //   ],
                // ),
              ),
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
