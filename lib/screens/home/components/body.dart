import 'package:flutter/material.dart';
import 'package:kattalocal/constants.dart';
import 'package:kattalocal/data/business_rest_util.dart';
import 'package:kattalocal/models/Business.dart';
import 'package:kattalocal/screens/home/components/analytics_summary_business.dart';
import 'package:kattalocal/screens/home/components/business_listing.dart';
import 'package:kattalocal/screens/home/components/categories.dart';
import 'package:kattalocal/screens/home/components/home_header.dart';
import 'package:kattalocal/screens/home/components/offer_listing.dart';
import 'package:kattalocal/screens/home/components/offer_listing_header.dart';
import 'package:kattalocal/size_config.dart';
import 'package:kattalocal/data/business_rest_util.dart';

class Body extends StatefulWidget {
  final Business business;

  const Body({Key? key, required this.business}) : super(key: key);

  @override
  State<Body> createState() => _BodyState(business: business);
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    print("CCCCC ");
    print(business.name);
  }

  final Business business;
  _BodyState({required this.business});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(business: business),
            SizedBox(height: getProportionateScreenHeight(20)),
            const AnalyticsSummaryForBusiness(),
            SizedBox(height: getProportionateScreenWidth(20)),
            OfferListingHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            OfferListing(business: business,)
            // const BusinessListing()
            // DiscountBanner(),
            // Categories(),
          ],
        ),
      ),
    );
  }
  
  Widget offerListingTitle() {
    return Text("Active Offers Published",style: headingStyleMedium,);
  }
}
