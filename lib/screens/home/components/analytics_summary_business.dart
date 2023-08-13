import 'package:flutter/material.dart';
import 'package:kattalocal/constants.dart';

class AnalyticsSummaryForBusiness extends StatefulWidget {
  const AnalyticsSummaryForBusiness({Key? key}) : super(key: key);

  @override
  State<AnalyticsSummaryForBusiness> createState() =>
      _AnalyticsSummaryForBusinessState();
}

class _AnalyticsSummaryForBusinessState
    extends State<AnalyticsSummaryForBusiness> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const SizedBox(
            width: 25,
          ),
          analyticsSummaryPerColumn("No. of Posts", "12"),
          const SizedBox(
            width: 15,
          ),
          const VerticalDivider(
            color: Colors.black,
            thickness: 2,
          ),
          const SizedBox(
            width: 15,
          ),
          analyticsSummaryPerColumn("No. of Views", "29"),
          const SizedBox(
            width: 15,
          ),
          const VerticalDivider(
            color: Colors.black,
            thickness: 2,
          ),
          const SizedBox(
            width: 15,
          ),
          analyticsSummaryPerColumn("No. of Page Visits", "209"),
        ],
      ),
    );
  }

  Widget analyticsSummaryPerColumn(String title, String value) {
    return Column(
      children: [
        Row(children: [Text(title)]),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(value, style: analyticsSummaryValue),
          ],
        )
      ],
    );
  }
}
