import 'package:flutter/material.dart';
import 'package:kattalocal/constants.dart';
import 'package:kattalocal/size_config.dart';

import 'publish_offer_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Publish Your Offer", style: headingStyle),
                // const Text(
                //   "Ready to Join? Register your \nbusiness now",
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                PublishOfferForm(),
                SizedBox(height: getProportionateScreenHeight(30)),
                // Text(
                //   "By continuing your confirm that you agree \nwith our Term and Condition",
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context).textTheme.caption,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
