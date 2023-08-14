import 'package:flutter/material.dart';
import 'package:kattalocal/constants.dart';
import 'package:kattalocal/details/business_details_screen.dart';
import 'package:kattalocal/models/Business.dart';
import 'package:kattalocal/models/offer.dart';
import 'package:kattalocal/size_config.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({Key? key, required this.offer}) : super(key: key);

  Widget customOfferCard(Offer offer) {
    return Card(
      shape: RoundedRectangleBorder(
          //<-- SEE HERE
          side: const BorderSide(
            color: Colors.redAccent,
          ),
          borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            height: 110,
            child: ListTile(
              isThreeLine: true,
              leading: Column(
                children: [
                  SizedBox(
                      height: getProportionateScreenHeight(41),
                      width: 100.0, // fixed width and height
                      child: CircleAvatar(
                        child: Image.asset("assets/images/shop.jpeg"),
                      )),
                  Text(
                    "30% Off",
                    style: headingStyleSmallGreen,
                  )
                ],
              ),
              title: Text(
                offer.title,
                style: headingStyleMedium,
              ),
              subtitle: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Current Price: ${offer.currentPrice}",
                        style: headingStyleSmallMedium,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Offer Price: ${offer.offerPrice}",
                        style: headingStyleSmallMedium,
                      ),
                    ],
                  ),
                ],
              ),
              // trailing: Text("23% ",style: headingStyleMediumGreen,),
            ),
          ),
          SizedBox(
            width: 350,
            height: 50,
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'End Date: ${offer.endDate}',
                    style: headingStyleSmallMedium,
                  ),
                  Text(
                    'No Of Views: 24',
                    style: headingStyleSmallMediumItalicRed,
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    " Modify  ",
                    style: TextStyle(
                        backgroundColor: Colors.orangeAccent, fontSize: 15),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: customOfferCard(offer),
    );
  }
}
