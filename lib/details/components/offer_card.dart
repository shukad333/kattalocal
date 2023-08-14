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

      child: SizedBox(
        width: 350,
        height: 300,
        child: ListTile(
          isThreeLine: true,
          leading: Image.asset("assets/images/shop.jpeg"),
          title: Text(offer.title,style: headingStyleMedium,),
          subtitle: Row(
            children: [
              Column(
                children: [
                  const SizedBox(height: 20,),
                  Text("Current Price: ${offer.currentPrice}",style: headingStyleSmallMedium,),
                  const SizedBox(height: 20,),
                  Text("Offer Price: ${offer.offerPrice}",style: headingStyleSmallMedium,),
                ],
              ),
            ],
          ),
          trailing: Text("23% ",style: headingStyleMediumGreen,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: customOfferCard(offer),
    );
  }

  Widget _build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(

        height: 500,
        width: 500,
        margin: const EdgeInsets.all(1.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Column(
                children: [
                  SizedBox(
                    width: 88,
                    child: AspectRatio(
                      aspectRatio: 0.88,
                      child: Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset("assets/images/shop.jpeg"),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                children: [
                  Text(
                    offer.description,
                    style: headingStyleMedium,
                  )
                ],
              )
            ]),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "End Date : ${offer.endDate}",
                      style: headingStyleSmall,
                    )
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Actual Price : 90",
                          style: headingStyleSmallMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Offer Price : 80",
                          style: headingStyleSmallMedium,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "No of Views : 24",
                      style: headingStyleSmallRed,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget __build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: 88,
                  child: AspectRatio(
                    aspectRatio: 0.88,
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset("assets/images/shop.jpeg"),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.title,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10),
                    Text.rich(
                      TextSpan(
                        text: "${offer.description}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: kPrimaryColor),
                        children: [
                          TextSpan(
                              text: "",
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
