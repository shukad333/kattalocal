import 'package:flutter/material.dart';

//Offer Model for interacting with the offer API from backend
class Offer {
  late int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String currentPrice;
  final String offerPrice;

  Offer({required this.title,required this.description,required this.startDate,required this.endDate,required this.offerPrice,required this.currentPrice, required id});

  // Offer.withId({required this.id,required this.title,required this.description,required this.startDate,required this.endDate,required this.offerPrice,required this.currentPrice});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id:json['id'],
      title: json['title'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      offerPrice: json['offerPrice'],
      currentPrice: json['currentPrice']
    );



  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'startDate': startDate,
      'endDate': endDate,
      'offerPrice': offerPrice,
      'currentPrice': currentPrice
    };
  }
}