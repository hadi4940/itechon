import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/landing_page/widgets/join_us_card.dart';
import 'package:responsive_grid/responsive_grid.dart';

class JoinUs extends StatefulWidget {
  const JoinUs({super.key});

  @override
  State<JoinUs> createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Join us",
                style: TextStyle(color: kGreyColor),
              ),
              Text(
                "Join our passionate team as",
                style: kMainHeadingStyle,
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
          ResponsiveGridRow(
            children: [
              // Team 1
              ResponsiveGridCol(
                lg: 4,
                md: 6,
                sm: 12,
                child: const JoinUsCard(
                  imagePath: "assets/images/team_1.png",
                  teamName: "Finance Team",
                  teamDescribtion:
                      "Exciting events ahead at the IIT! From insightful lectures to cultural festivals and sports, there's something for everyone. Join for enriching experiences and a vibrant community vibe!",
                  buttonText: "Register now",
                ),
              ),
              //Team 2
              /*ResponsiveGridCol(
                lg: 4,
                md: 6,
                sm: 12,
                child: const JoinUsCard(
                  imagePath: "assets/images/team_2.png",
                  teamName: "Literature Team",
                  teamDescribtion:
                      "Exciting events ahead at the IIT! From insightful lectures to cultural festivals and sports, there's something for everyone. Join for enriching experiences and a vibrant community vibe!",
                  buttonText: "Register now",
                ),
              ),*/
              // Team 3
              ResponsiveGridCol(
                lg: 4,
                md: 6,
                sm: 12,
                child: const JoinUsCard(
                  imagePath: "assets/images/team_3.png",
                  teamName: "Security Team",
                  teamDescribtion:
                      "Exciting events ahead at the IIT! From insightful lectures to cultural festivals and sports, there's something for everyone. Join for enriching experiences and a vibrant community vibe!",
                  buttonText: "Register now",
                ),
              ),
              // Team 4
              ResponsiveGridCol(
                lg: 4,
                md: 6,
                sm: 12,
                child: const JoinUsCard(
                  imagePath: "assets/images/team_4.png",
                  teamName: "Media Team",
                  teamDescribtion:
                      "Exciting events ahead at the IIT! From insightful lectures to cultural festivals and sports, there's something for everyone. Join for enriching experiences and a vibrant community vibe!",
                  buttonText: "Register now",
                ),
              ),
              // Team 5
              ResponsiveGridCol(
                lg: 4,
                md: 6,
                sm: 12,
                child: const JoinUsCard(
                  imagePath: "assets/images/team_5.png",
                  teamName: "Logistic Team",
                  teamDescribtion:
                      "Exciting events ahead at the IIT! From insightful lectures to cultural festivals and sports, there's something for everyone. Join for enriching experiences and a vibrant community vibe!",
                  buttonText: "Register now",
                ),
              ),
              // Team 6
              /*ResponsiveGridCol(
                lg: 4,
                md: 6,
                sm: 12,
                child: const JoinUsCard(
                  imagePath: "assets/images/team_6.png",
                  teamName: "Sports Team",
                  teamDescribtion:
                      "Exciting events ahead at the IIT! From insightful lectures to cultural festivals and sports, there's something for everyone. Join for enriching experiences and a vibrant community vibe!",
                  buttonText: "Register now",
                ),
              ),*/

              //Team 7
              /*ResponsiveGridCol(
                lg: 4,
                md: 6,
                sm: 12,
                child: const JoinUsCard(
                  imagePath: "assets/images/team_7.png",
                  teamName: "Event Management Team",
                  teamDescribtion:
                      "Exciting events ahead at the IIT! From insightful lectures to cultural festivals and sports, there's something for everyone. Join for enriching experiences and a vibrant community vibe!",
                  buttonText: "Register now",
                ),
              ),*/
              // Team 8
              ResponsiveGridCol(
                lg: 4,
                md: 6,
                sm: 12,
                child: const JoinUsCard(
                  imagePath: "assets/images/team_8.png",
                  teamName: "Arts & Decoration Team ",
                  teamDescribtion:
                      "Exciting events ahead at the IIT! From insightful lectures to cultural festivals and sports, there's something for everyone. Join for enriching experiences and a vibrant community vibe!",
                  buttonText: "Register now",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
