import 'package:flutter/material.dart';

// colors
const kPrimaryColor = Color(0xFF3895D3);
const kSecondardColor = Color(0xFF4CA0D7);
const kDarkPrimaryColor = Color(0xFF003E8B);
const kTextColor = Color(0xFF373737);
const kShadowColor = Color(0xFFEEEEEE);
const kNavBarColor1 = Color(0xaa111111);
const kGreyColor = Colors.grey;
const kFooterColor = Color(0xFF1A5197);

// styles
const kMainHeadingWithLineStyle = TextStyle(
  decoration: TextDecoration.underline,
  decorationColor: kDarkPrimaryColor,
  fontSize: 36,
  color: kDarkPrimaryColor,
);

const kMainHeadingStyle = TextStyle(
  fontSize: 30,
  color: kDarkPrimaryColor,
  fontWeight: FontWeight.w600,
);

const kSmallSubHeading = TextStyle(fontSize: 14, color: kSecondardColor);

const kSportSmallHeading = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w800,
  color: kDarkPrimaryColor,
);

const kSportTeamHeading = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: kSecondardColor,
);

const kNavBarTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

const kBoxShadow = BoxShadow(
  //color: Color(0x3f000000)
  color: kGreyColor,
  blurRadius: 4,
  spreadRadius: 0,
  offset: Offset(0, 0),
);

const kFooterTextStyle = TextStyle(color: Colors.white);
