import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/events_page/events_page.dart';

class IitEventPointsLink extends StatelessWidget {
  const IitEventPointsLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // "Sports",
      //               "Geekathon",
      //               "Research Symposium",
      //               "Tech Prenur’s Galore",
      //               "Hunerkand",
      //               "Grand Final"
      children: [
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              "\u2022",
              style: TextStyle(color: kPrimaryColor, fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, EventsPage.route);
              },
              child: const Text(
                "Indoor Sports",
                style: TextStyle(color: kPrimaryColor, fontSize: 16),
              ),
            )
          ],
        ),

        // 2
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            const Text(
              "\u2022",
              style: TextStyle(color: kPrimaryColor, fontSize: 20),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, EventsPage.route);
              },
              child: const Text(
                "GeeKathon",
                style: TextStyle(color: kPrimaryColor, fontSize: 16),
              ),
            )
          ],
        ),
      ],
    );
  }
}
