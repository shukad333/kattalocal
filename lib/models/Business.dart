import 'package:flutter/material.dart';

class Business {
  final int id;
  final String name;
  final String type;

  Business({required this.id, required this.name, required this.type});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      type: json['type'],
    );
  }
}