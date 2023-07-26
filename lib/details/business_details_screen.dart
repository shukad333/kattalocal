import 'package:flutter/material.dart';
import 'package:kattalocal/details/components/body.dart';
import 'package:kattalocal/details/components/custom_app_bar.dart';
import 'package:kattalocal/models/Business.dart';

class BusinessDetailsScreen extends StatelessWidget {

  static String routeName = "/details";

  const BusinessDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BusinessDetailsArguments args =
    ModalRoute.of(context)!.settings.arguments as BusinessDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: 1.0),
      ),
      body: Body(business: args.business),
    );
  }
}

class BusinessDetailsArguments {
  final Business business;

  BusinessDetailsArguments({required this.business});
}