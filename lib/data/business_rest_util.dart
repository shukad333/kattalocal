import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kattalocal/models/Business.dart';

class BusinessRestUtil {
  static Future<List<Business>> getBusinessData() async {
    //String url = "http://192.168.1.7:8081/api/v1/business";
    String url = "http://10.0.2.2:8081/api/v1/business";
    //   String url = "http://127.0.0.1:8081/api/v1/business";
    http.Response resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      List<dynamic>? list = json.decode(resp.body) as List;
      print('XXXX');
      print(list);
      List<Business> businesses =
          list?.map((dynamic i) => Business.fromJson(i)).toList() ?? [];
      return businesses;
    }
    return List.empty();
  }
}
