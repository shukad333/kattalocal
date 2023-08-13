import 'package:flutter/material.dart';

class Offer {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;

  Offer({required this.id,required this.title,required this.description,required this.startDate,required this.endDate});


  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      startDate: json['startDate'],
      endDate: json['endDate'],
    );
  }
}