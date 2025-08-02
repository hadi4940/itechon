import 'package:flutter/material.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:card_swiper/card_swiper.dart';

class LandingPageBanner extends StatelessWidget {
  const LandingPageBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        SizedBox(
          width: screenWidth,
          height: MediaQuery.of(context).size.height,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                "assets/images/banner_${index + 1}.png",
                fit: BoxFit.fill,
              );
            },
            loop: true,
            autoplay: true,
            itemCount: 3,
            pagination: SwiperPagination(),
            control: SwiperControl(),
          ),

          // Image.asset(
          //   "assets/images/landing_page_banner.png",
          //   fit: BoxFit.fill,
          // ),
        ),
        SizedBox(
          width: screenWidth,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: ResponsiveWidget.isSmallScreen(context)
                    ? const EdgeInsets.only(left: 5)
                    : const EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveWidget.isSmallScreen(context)
                        ? const SizedBox(
                            height: 0,
                          )
                        : const SizedBox(
                            height: 200,
                          ),
                    Image.asset(
                      "assets/logo/IT_mentoring.png",
                      height: 75,
                      width: 180,
                      fit: BoxFit.fill,
                    ),
                    const Text(
                      "IiTechon",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 400,
                      child: Text(
                        "IIT society strives to engage the students of the Institute in healthy activities in order to encourage teamwork and instill in them a sense of responsibility and ownership.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: ResponsiveWidget.isSmallScreen(context) ? null : null,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          width: 60,
                        ),
                        Image.asset(
                          "assets/logo/logo_1.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Image.asset(
                          "assets/logo/logo_4.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Image.asset(
                          "assets/logo/logo_3.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Image.asset(
                          "assets/logo/logo_2.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Image.asset(
                          "assets/logo/logo_5.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Image.asset(
                          "assets/logo/logo_1.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Image.asset(
                          "assets/logo/logo_2.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Image.asset(
                          "assets/logo/logo_1.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        Image.asset(
                          "assets/logo/logo_4.png",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
