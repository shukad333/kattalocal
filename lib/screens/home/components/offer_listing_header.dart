import 'package:flutter/material.dart';
import 'package:kattalocal/constants.dart';
import 'package:kattalocal/models/Business.dart';
import 'package:path/path.dart';

import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';

class OfferListingHeader extends StatelessWidget {

  const OfferListingHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          children: [
            const SizedBox(width: 12,),
            Text(
              "Active Offers",
              style: headingStyleMedium,
            )
          ],
        ),
      ],
    );
  }
}
