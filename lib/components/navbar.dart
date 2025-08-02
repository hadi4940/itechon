import 'package:flutter/material.dart';
import 'package:itechone/admin/login/admin_login_page.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/announcements/announcement_user.dart';
import 'package:itechone/pages/core_page/core_page.dart';
import 'package:itechone/pages/download_page/download_page.dart';
import 'package:itechone/pages/events_page/events_page.dart';
import 'package:itechone/pages/gallery_page/gallery_page.dart';
import 'package:itechone/pages/landing_page/landing_page.dart';
import 'package:itechone/pages/management_registration/management_registration.dart';
import 'package:itechone/pages/register_now_page/register_now.dart';
import 'package:itechone/pages/register_now_page_solo/register_now_solo.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/widgets/main_button.dart';

class NavBar extends StatelessWidget {
  final Color color;
  const NavBar({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return (!ResponsiveWidget.isSmallScreen(context) &&
            !ResponsiveWidget.isMediumScreen(context))
        ? ResponsiveWidget(
            largeScreen: Container(
              color: color,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              height: 90,
              child: Row(
                  mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      hoverColor: Colors.transparent,
                      onTap: () {
                        Navigator.popAndPushNamed(context, LandingPage.route);
                      },
                      child: Image.asset(
                        "assets/logo/logo.png",
                        height: 70,
                        width: 100,
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AdminLoginPage.route);
                          },
                          child: const Text('Admin', style: kNavBarTextStyle),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(EventsPage.route);
                          },
                          child: const Text('Events', style: kNavBarTextStyle),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(CorePage.route);
                          },
                          child: const Text('Core', style: kNavBarTextStyle),
                        ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: const Text('Team', style: kNavBarTextStyle),
                        // ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(GalleryPage.route);
                          },
                          child: const Text('Gallery', style: kNavBarTextStyle),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AnnouncementUsers.route);
                          },
                          child: const Text('Announcements',
                              style: kNavBarTextStyle),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(DownloadPage.route);
                          },
                          child:
                              const Text('Download', style: kNavBarTextStyle),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(ManagementRegisteration.route);
                          },
                          child:
                              const Text('Volunteer', style: kNavBarTextStyle),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(RegisterNowPageSolo.route);
                          },
                          child: const Text('Register Solo',
                              style: kNavBarTextStyle),
                        ),
                        MainButton(
                          text: "Register Team",
                          onPress: () {
                            Navigator.of(context)
                                .pushNamed(RegisterNowPage.route);
                          },
                        ),
                        /*IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ))*/
                      ],
                    )
                  ]),
            ),
          )
        : const SizedBox();
  }
}
