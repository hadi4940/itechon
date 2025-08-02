import 'package:flutter/material.dart';
import 'package:itechone/admin/admin_gallery/admin_gallery.dart';
import 'package:itechone/admin/admin_payment/admin_payment_solo.dart';
import 'package:itechone/admin/admin_payment/admin_payment_team.dart';
import 'package:itechone/admin/admin_tickets/admin_tickets.dart';
import 'package:itechone/admin/announcements/admin_announcements_page.dart';
import 'package:itechone/admin/download_page_admin/download_page_admin.dart';
import 'package:itechone/admin/events/admin_event_page.dart';
import 'package:itechone/admin/events/admin_event_update_page.dart';
import 'package:itechone/admin/login/admin_login_page.dart';
import 'package:itechone/admin/management/management_page_admin.dart';
import 'package:itechone/admin/show_register_student/show_register_students.dart';
import 'package:itechone/pages/announcements/announcement_user.dart';
import 'package:itechone/pages/book_ticket_page/book_ticket_page.dart';
import 'package:itechone/pages/download_page/download_page.dart';
import 'package:itechone/pages/hunarkada_page/hunarkada_page.dart';
import 'package:itechone/pages/management_registration/management_registration.dart';
import 'package:itechone/pages/register_now_page/register_now.dart';
import 'package:itechone/pages/core_page/core_page.dart';
import 'package:itechone/pages/events_page/events_page.dart';
import 'package:itechone/pages/gallery_page/gallery_page.dart';
import 'package:itechone/pages/landing_page/landing_page.dart';
import 'package:itechone/pages/register_now_page_solo/register_now_solo.dart';

final Map<String, WidgetBuilder> routes = {
  LandingPage.route: (context) => const LandingPage(),
  CorePage.route: (context) => const CorePage(),
  GalleryPage.route: (context) => GalleryPage(),
  RegisterNowPage.route: (context) => RegisterNowPage(),
  EventsPage.route: (context) => const EventsPage(),
  HunarkadaPage.route: (context) => const HunarkadaPage(),
  DownloadPage.route: (context) => const DownloadPage(),
  AdminLoginPage.route: (context) => const AdminLoginPage(),
  AdminEventsPage.route: (context) => const AdminEventsPage(),
  ManagementPageAdmin.route: (context) => ManagementPageAdmin(),
  ManagementRegisteration.route: (context) => ManagementRegisteration(),
  AdminAnnouncementsPage.route: (context) => AdminAnnouncementsPage(),
  AnnouncementUsers.route: (context) => AnnouncementUsers(),
  AdminEventUpdatePage.route: (context) => const AdminEventUpdatePage(),
  AdminPaymentTeam.route: (context) => AdminPaymentTeam(),
  AdminPaymentSolo.route: (context) => AdminPaymentSolo(),
  ShowRegisterStudents.route: (context) => ShowRegisterStudents(),
  RegisterNowPageSolo.route: (context) => RegisterNowPageSolo(),
  BookTicketPage.route: (context) => const BookTicketPage(),
  AdminTickets.route: (context) => AdminTickets(),
  DownloadPageAdmin.route: (context) => const DownloadPageAdmin(),
  AdminaGallery.route: (context) => const AdminaGallery(),
};
