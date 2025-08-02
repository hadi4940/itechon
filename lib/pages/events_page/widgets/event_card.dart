import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/widgets/main_button.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String team;
  final String date;
  final String venue;
  final String imagePath;
  final VoidCallback onPress;

  const EventCard({
    super.key,
    required this.eventName,
    required this.team,
    required this.date,
    required this.venue,
    required this.imagePath,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [kBoxShadow],
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            eventName,
            style: kMainHeadingStyle.copyWith(fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            team,
            style: const TextStyle(color: kSecondardColor, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(date),
          const SizedBox(
            height: 10,
          ),
          Text(venue),
          const SizedBox(
            height: 10,
          ),
          MainButton(
            text: "See more",
            onPress: onPress,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
