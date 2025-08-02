import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';

class EventHighlights extends StatelessWidget {
  const EventHighlights({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Latest Event",
            style: kSmallSubHeading,
          ),
          Text(
            "Event Highlights",
            style: kMainHeadingWithLineStyle.copyWith(fontSize: 32),
          ),
          const Text(
            "We are thrilled to announce the successful completion of ITECHON, an event organized by our department last month. ITECHON provided entrepreneurs with an invaluable platform to showcase their businesses, offering dedicated stalls where participants could take home all their profits. This initiative aimed to foster entrepreneurship, creativity, and innovation within our community.",
            style: TextStyle(
              color: kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
