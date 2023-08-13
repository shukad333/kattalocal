import 'package:flutter/material.dart';
import 'package:kattalocal/constants.dart';
import 'package:kattalocal/models/Business.dart';
import 'package:path/path.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  final Business business;

  const HomeHeader({
    Key? key,
    required this.business,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            const SizedBox(width: 12,),
            Text(
              "Hello ${business.name}",
              style: headingStyle,
            )
          ],
        ),
        Row(
          children: [
            const SizedBox(width: 12,),
            Expanded(
              child: Text(
                business.address1??'',
                style: businessAddressDashboard,
              ),
            )
          ],
        )
      ],
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Padding(
//     padding:
//     EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // SearchField(),
//         // IconBtnWithCounter(
//         //   svgSrc: "assets/icons/Cart Icon.svg",
//         //   press: () => {},
//         // ),
//         IconBtnWithCounter(
//           svgSrc: "assets/icons/Bell.svg",
//           numOfitem: 3,
//           press: () {},
//         ),
//       ],
//     ),
//   );
// }
}
