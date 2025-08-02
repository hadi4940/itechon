import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';

class AnnouncementCard extends StatelessWidget {
  final String messageBy;
  final DateTime date;
  final String message;
  const AnnouncementCard(
      {super.key,
      required this.messageBy,
      required this.date,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(4),
      decoration: const BoxDecoration(
        boxShadow: [kBoxShadow],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Message By",
            style: TextStyle(color: Colors.grey),
          ),
          Text(
            messageBy,
            style: const TextStyle(
              color: kDarkPrimaryColor,
              fontSize: 30,
            ),
          ),
          Text(
            date.toString(),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          Text(
            message,
            style: const TextStyle(color: kTextColor),
          ),
        ],
      ),
    );
  }
}
