import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/management_registration/management_registration.dart';
import 'package:itechone/widgets/main_button.dart';

class JoinUsCard extends StatelessWidget {
  final String imagePath;
  final String teamName;
  final String teamDescribtion;
  final String buttonText;
  //final VoidCallback onPress;

  const JoinUsCard({
    super.key,
    required this.teamName,
    required this.teamDescribtion,
    required this.buttonText,
    // required this.onPress,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          kBoxShadow,
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text(
                  teamName,
                  style:
                      const TextStyle(color: kDarkPrimaryColor, fontSize: 18),
                ),
                Text(teamDescribtion),
                const SizedBox(
                  height: 10,
                ),
                MainButton(
                  text: buttonText,
                  onPress: () {
                    Navigator.of(context)
                        .pushNamed(ManagementRegisteration.route);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
