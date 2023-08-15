import 'package:flutter/material.dart';

class Events {
  late int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;

  Events(
      {required this.title,
      required this.description,
      required this.startDate,
      required this.endDate,
      required id});

  factory Events.fromJson(Map<String, dynamic> json) {
    return Events(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        startDate: json['startDate'],
        endDate: json['endDate']);
  }
}
