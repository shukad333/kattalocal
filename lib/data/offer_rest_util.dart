import 'package:flutter/material.dart';
import 'package:kattalocal/models/offer.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class OfferRestUtil extends ChangeNotifier {
  final String offerUri = "";

  bool loading = false;
  bool isBack = false;

  Future<Offer> saveOffer(String businessId, Offer offer) async {
    loading = true;
    notifyListeners();

    String url = "http://10.0.2.2:8081/api/v1/1/offers";
    //use the below for ios
    // String url = "http://0.0.0.0:8081/api/v1/1/offers";
    //   String url = "http://127.0.0.1:8081/api/v1/business";
    http.Response resp = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(offer.toJson()));

    print(resp.statusCode);
    if (resp.statusCode == 201) {
      isBack = true;
      loading = false;
      notifyListeners();
      print(Offer.fromJson(jsonDecode(resp.body)));
      return Offer.fromJson(jsonDecode(resp.body));
    }
    loading = false;
    notifyListeners();
    throw Exception("Unable to create new offer");
  }
}
