import 'package:flutter/material.dart';
import 'package:kattalocal/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final headingStyleSmall = TextStyle(
  fontSize: getProportionateScreenWidth(10),
  fontWeight: FontWeight.normal,
  color: Colors.black,
  height: 1.5,
);

final headingStyleSmallMedium = TextStyle(
  fontSize: getProportionateScreenWidth(15),
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: Colors.black,
  height: 1.5,
);

final headingStyleSmallMediumItalicRed = TextStyle(
  fontSize: getProportionateScreenWidth(15),
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic,
  color: Colors.redAccent,
  height: 1.5,
);

final headingStyleSmallRed = TextStyle(
  fontSize: getProportionateScreenWidth(10),
  fontWeight: FontWeight.normal,
  color: Colors.red,
  height: 1.5,
);

final headingStyleMedium = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final headingStyleMediumGreen = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.bold,
  color: Colors.green,
  height: 1.2,
);

final headingStyleSmallGreen = TextStyle(
  fontSize: getProportionateScreenWidth(15),
  fontWeight: FontWeight.bold,
  color: Colors.green,
  height: 1.2,
);

final businessAddressDashboard = TextStyle(
  fontSize: getProportionateScreenWidth(15),
  fontWeight: FontWeight.bold,
  color: Colors.blueAccent,
  height: 1,
);

final analyticsSummaryValue = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.blueAccent,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}