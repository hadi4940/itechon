import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';

class AdminHunerkadaCard extends StatelessWidget {
  const AdminHunerkadaCard({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
  });
  final String name;
  final String description;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [kBoxShadow],
        borderRadius: BorderRadius.all(
          Radius.circular(18.0),
        ),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              imagePath,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: kDarkPrimaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(description, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
