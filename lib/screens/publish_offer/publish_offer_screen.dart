import 'package:flutter/material.dart';

import 'components/body.dart';

class PublishOfferScreen extends StatelessWidget {
  static String routeName = "/publish_offer";

  const PublishOfferScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}