import 'package:flutter/material.dart';
import 'package:itechone/admin/admin_gallery/admin_gallery.dart';
import 'package:itechone/admin/admin_payment/admin_payment_solo.dart';
import 'package:itechone/admin/admin_payment/admin_payment_team.dart';
import 'package:itechone/admin/admin_tickets/admin_tickets.dart';
import 'package:itechone/admin/announcements/admin_announcements_page.dart';
import 'package:itechone/admin/download_page_admin/download_page_admin.dart';
import 'package:itechone/admin/events/admin_event_update_page.dart';
import 'package:itechone/admin/login/admin_login_page.dart';
import 'package:itechone/admin/management/management_page_admin.dart';
import 'package:itechone/admin/show_register_student/show_register_students.dart';
import 'package:itechone/constants/constants.dart';
import 'package:itechone/pages/landing_page/landing_page.dart';
import 'package:itechone/responsive/responsive_widget.dart';
import 'package:itechone/widgets/main_button.dart';
import 'package:itechone/admin/events/admin_event_page.dart';

class AdminNavBar extends StatelessWidget {
  final Color color;
  const AdminNavBar({super.key, required this.color});

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
                        Navigator.popAndPushNamed(
                            context, AdminEventsPage.route);
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
                            Navigator.of(context)
                                .pushNamed(ManagementPageAdmin.route);
                          },
                          child:
                              const Text('Management', style: kNavBarTextStyle),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AdminEventUpdatePage.route);
                          },
                          child: const Text('Event Update',
                              style: kNavBarTextStyle),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AdminAnnouncementsPage.route);
                          },
                          child: const Text('Ann', style: kNavBarTextStyle),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(DownloadPageAdmin.route);
                          },
                          child:
                              const Text('Download', style: kNavBarTextStyle),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AdminaGallery.route);
                          },
                          child: const Text('Gallery', style: kNavBarTextStyle),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AdminPaymentTeam.route);
                          },
                          child: const Text('Team Payments',
                              style: kNavBarTextStyle),
                        ),
                        // TextButton(
                        //   onPressed: () {
                        //     Navigator.of(context).pushNamed(AdminTickets.route);
                        //   },
                        //   child: const Text('Tickets', style: kNavBarTextStyle),
                        // ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AdminPaymentSolo.route);
                          },
                          child: const Text('Solo Payments',
                              style: kNavBarTextStyle),
                        ),
                        MainButton(
                          text: "Register Students",
                          onPress: () {
                            Navigator.of(context)
                                .pushNamed(ShowRegisterStudents.route);
                          },
                        ),
                      ],
                    )
                  ]),
            ),
          )
        : const SizedBox();
  }
}
