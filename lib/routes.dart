import 'package:flutter/widgets.dart';
import 'package:kattalocal/business_detail.dart';
import 'package:kattalocal/details/business_details_screen.dart';
import 'package:kattalocal/screens/complete_profile/complete_profile_screen.dart';
import 'package:kattalocal/screens/home/home_screen.dart';
import 'package:kattalocal/screens/login_success/login_success_screen.dart';
import 'package:kattalocal/screens/otp/otp_screen.dart';
import 'package:kattalocal/screens/publish_offer/publish_offer_screen.dart';
import 'package:kattalocal/screens/sign_in/sign_in_screen.dart';
import 'package:kattalocal/screens/sign_up/sign_up_screen.dart';
import 'package:kattalocal/screens/splash/splash_screen.dart';
import 'package:path/path.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  BusinessDetailsScreen.routeName: (context) => BusinessDetailsScreen(),
  PublishOfferScreen.routeName: (context) => PublishOfferScreen(),

};