import 'package:flutter/material.dart';
import 'package:kattalocal/constants.dart';
import 'package:kattalocal/details/business_details_screen.dart';
import 'package:kattalocal/models/Business.dart';
import 'package:kattalocal/models/offer.dart';
import 'package:kattalocal/size_config.dart';

class OfferCard extends StatelessWidget {
  final Offer offer;

  const OfferCard({Key? key, required this.offer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Row(
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
                  text: "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor),
                  children: [
                    TextSpan(
                        text: "", style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
