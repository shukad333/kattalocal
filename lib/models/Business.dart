import 'package:flutter/material.dart';

class Business {
  final int id;
  final String name;
  final String type;
  final String address1;

  Business({required this.id, required this.name, required this.type,required this.address1});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      address1: json['address1']
    );
  }
}