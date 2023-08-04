import 'package:flutter/material.dart';
import 'package:kattalocal/components/coustom_bottom_nav_bar.dart';
import 'package:kattalocal/constants.dart';
import 'package:kattalocal/enums.dart';
import 'package:kattalocal/screens/home/components/multi_action_floating_action.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: MultiFb(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
