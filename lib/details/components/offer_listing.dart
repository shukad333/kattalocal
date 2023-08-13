import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kattalocal/data/business_rest_util.dart';
import 'package:kattalocal/details/components/offer_card.dart';
import 'package:kattalocal/models/Business.dart';
import 'package:kattalocal/models/offer.dart';
import 'package:kattalocal/screens/home/components/business_card.dart';
import 'package:kattalocal/size_config.dart';
import 'package:http/http.dart' as http;

class OfferListing extends StatefulWidget {
  final int businessid;
  const OfferListing({Key? key,required this.businessid}) : super(key: key);

  @override
  State<OfferListing> createState() => _OfferListingState(businessId: this.businessid);
}

class _OfferListingState extends State<OfferListing> {
  var business;
  var businessId;
  _OfferListingState({required this.businessId}) {

  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    // business = _getBusinessData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder<List<Offer>>(
            future: _getOfferForBusinessData(businessId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: OfferCard(offer: snapshot.data![index]),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }));
  }

  Future<List<Offer>> _getOfferForBusinessData(int businessId) async {
    String url = "http://192.168.1.7:8081/api/v1/$businessId/offers";
    http.Response resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      var list = json.decode(resp.body) as List;
      print('XXXX Offers');
      print(list);
      List<Offer> offers =
          list.map((i) => Offer.fromJson(i)).toList();
      return offers;
    }
    return List.empty();
  }
}
