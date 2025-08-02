import 'package:flutter/material.dart';
import 'package:itechone/constants/constants.dart';
import 'package:video_player/video_player.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/about.m4v",
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Us.',
                style: TextStyle(color: kSecondardColor),
              ),
              Text(
                'ITECHON',
                style: kMainHeadingWithLineStyle,
              ),
            ],
          ),
          const SizedBox(
            width: 800,
            child: Text(
              "At I.I.T, we aspire to excel in teaching, research, and innovation, aligning with Quaid-i-Azam University's vision. Our BS-IT program provides a strong theoretical and practical foundation, emphasizing real-world problem-solving using cutting-edge technologies.",
              style: TextStyle(color: kTextColor),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.only(top: 100, bottom: 50),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/about_us_Laptop.png"))),
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: 13 / 4,
                    child: VideoPlayer(
                      _controller,
                    ),
                  )
                : const CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
