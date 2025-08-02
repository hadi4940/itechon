import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/widgets/main_button.dart';

class DrawerForMobile extends StatelessWidget {
  const DrawerForMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      width: screenWidth * 0.80,
      backgroundColor: Colors.grey,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        children: [
          Image.asset(
            "assets/logo/logo.png",
            height: 70,
            width: 100,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text('Schedules', style: kNavBarTextStyle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text('Events', style: kNavBarTextStyle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text('Core', style: kNavBarTextStyle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text('Team', style: kNavBarTextStyle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text('Gallery', style: kNavBarTextStyle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text('Announcements', style: kNavBarTextStyle),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: const Text('Download', style: kNavBarTextStyle),
            ),
          ),
          MainButton(
            text: "Register Now",
            onPress: () {},
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
