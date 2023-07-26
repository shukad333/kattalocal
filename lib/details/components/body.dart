import 'package:flutter/material.dart';
import 'package:kattalocal/components/default_button.dart';
import 'package:kattalocal/models/Business.dart';
import 'package:kattalocal/size_config.dart';

import 'product_description.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final Business business;

  const Body({Key? key, required this.business}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              BusinessDescription(
                business: business,
                pressOnSeeMore: () {},
              ),
              // TopRoundedContainer(
              //   color: Color(0xFFF6F7F9),
              //   child: Column(
              //     children: [
              //       ColorDots(product: product),
              //       TopRoundedContainer(
              //         color: Colors.white,
              //         child: Padding(
              //           padding: EdgeInsets.only(
              //             left: SizeConfig.screenWidth * 0.15,
              //             right: SizeConfig.screenWidth * 0.15,
              //             bottom: getProportionateScreenWidth(40),
              //             top: getProportionateScreenWidth(15),
              //           ),
              //           child: DefaultButton(
              //             text: "Add To Cart",
              //             press: () {},
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}