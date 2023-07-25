import 'package:flutter/material.dart';
import 'package:kattalocal/screens/home/components/categories.dart';
import 'package:kattalocal/screens/home/components/home_header.dart';
import 'package:kattalocal/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          const HomeHeader(),
          SizedBox(height: getProportionateScreenWidth(10)),
          // DiscountBanner(),
          // Categories(),
        ],
      ),
    )
    );
  }
}
