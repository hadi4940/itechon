import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/single_sport_page/single_sport_page.dart';
import 'package:itechone/widgets/main_button.dart';

class HunerkadaCard extends StatelessWidget {
  const HunerkadaCard(
      {super.key,
      required this.name,
      required this.description,
      required this.imagePath});
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
          const SizedBox(
            height: 10,
          ),
          MainButton(
              text: "View",
              // onPress: () {
              //   Navigator.pushNamed(context, RegisterNowPageSolo.route);
              // })
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SingleSportPage(
                          sportName: name,
                          description: description,
                          imagePath: imagePath,
                          venue: "QAU",
                          date: "31 Dec 2024",
                          registerTeamOrSolo: "Register as Solo",
                          showWinners: true);
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
