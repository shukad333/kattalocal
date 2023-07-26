import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kattalocal/models/Business.dart';
import 'package:kattalocal/screens/home/components/business_card.dart';
import 'package:kattalocal/size_config.dart';
import 'package:http/http.dart' as http;

class BusinessListing extends StatefulWidget {
  const BusinessListing({Key? key}) : super(key: key);

  @override
  State<BusinessListing> createState() => _BusinessListingState();
}

class _BusinessListingState extends State<BusinessListing> {
  var business;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    business = _getBusinessData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder<List<Business>>(
            future: _getBusinessData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: BusinessCard(business: snapshot.data![index]),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }));
  }

  Future<List<Business>> _getBusinessData() async {
    String url = "http://192.168.1.7:8081/api/v1/business";
    http.Response resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      var list = json.decode(resp.body) as List;
      print('XXXX');
      print(list);
      List<Business> businesses =
          list.map((i) => Business.fromJson(i)).toList();
      return businesses;
    }
    return List.empty();
  }
}
