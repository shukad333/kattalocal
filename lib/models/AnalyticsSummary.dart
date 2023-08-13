import 'package:flutter/material.dart';

class AnalyticsSummary {
  final int noOfPosts;
  final int noOfViews;
  final int noOfPageViews;

  AnalyticsSummary({required this.noOfPosts,required this.noOfViews,required this.noOfPageViews});

  factory AnalyticsSummary.fromJson(Map<String, dynamic> json) {
    return AnalyticsSummary(
      noOfPosts: json['noOfPosts'],
      noOfViews: json['noOfViews'],
      noOfPageViews: json['noOfPageViews'],
    );
  }
}