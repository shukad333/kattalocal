import 'package:flutter/widgets.dart';
import 'package:kattalocal/screens/complete_profile/complete_profile_screen.dart';
import 'package:kattalocal/screens/home/home_screen.dart';
import 'package:kattalocal/screens/login_success/login_success_screen.dart';
import 'package:kattalocal/screens/otp/otp_screen.dart';
import 'package:kattalocal/screens/sign_in/sign_in_screen.dart';
import 'package:kattalocal/screens/sign_up/sign_up_screen.dart';
import 'package:kattalocal/screens/splash/splash_screen.dart';


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

};