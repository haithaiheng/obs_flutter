import 'dart:convert';

import 'package:get/get.dart';
import 'package:obs/app/constants/application.dart';

class PaywithbakongProvider extends GetConnect {
  Future<dynamic> orderBooks(body) async {
    final response = await post(
        "${application.apiBaseUrl}orders", jsonEncode(body),
        contentType: 'application/json');
    if (response.statusCode == 200) {
      // print(response.body);
      return response.body;
    } else {
      // print(response.statusText);
      return Future.error(response.statusText!);
    }
  }

  Future<dynamic> checkTransaction(String md5) async {
    try {
      Map<String, String> headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjp7ImlkIjoiY2VhMDI1NWRjZjY1NGUxMCJ9LCJpYXQiOjE3NDE2OTQ3NjYsImV4cCI6MTc0OTQ3MDc2Nn0.Dj8fZMTJDOLPbm2HqlAor1WE_EeEHVg9AEaCbUjnlcQ',
      };
      String mybody = jsonEncode(<String, String>{'md5': md5});
      var response = await post(
          "https://api-bakong.nbc.gov.kh/v1/check_transaction_by_md5", mybody,
          headers: headers);

      // print(response.body['responseMessage']);
      if (response.statusCode == 200) {
        var data = response.body;
        if (data['responseMessage'] == 'Success') {
          // print(data['data']['externalRef']);
          return data['data']['externalRef'];
        }
      } else {
        return null;
      }
    } catch (e) {
      print("check bakong transaction: $e");
    }
  }
}
