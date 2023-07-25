import 'package:flutter/material.dart';
import 'package:kattalocal/components/coustom_bottom_nav_bar.dart';
import 'package:kattalocal/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar:  CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}