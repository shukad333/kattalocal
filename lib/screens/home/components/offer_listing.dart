import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kattalocal/details/components/offer_card.dart';
import 'package:kattalocal/models/Business.dart';
import 'package:kattalocal/models/offer.dart';
import 'package:kattalocal/screens/home/components/business_card.dart';
import 'package:kattalocal/size_config.dart';
import 'package:http/http.dart' as http;

class OfferListing extends StatefulWidget {
  final Business business;

  const OfferListing({Key? key, required this.business}) : super(key: key);

  @override
  State<OfferListing> createState() => _OfferListing(business: business);
}

class _OfferListing extends State<OfferListing> {
  final Business business;

  _OfferListing({required this.business});

  var offers;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    offers = _getOffersData(business.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: FutureBuilder<List<Offer>>(
            future: _getOffersData(business.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
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

  Future<List<Offer>> _getOffersData(int businessId) async {
    //String url = "http://192.168.1.7:8081/api/v1/business";
    String url =
        "http://10.0.2.2:8081/api/v1/business/$businessId/offers";
    //   String url = "http://127.0.0.1:8081/api/v1/business";
    http.Response resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      var list = json.decode(resp.body) as List;
      print('XXXX');
      print(list);
      List<Offer> offers = list.map((i) => Offer.fromJson(i)).toList();
      return offers;
    }
    return List.empty();
  }
}
