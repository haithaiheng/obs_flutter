import 'dart:convert';

import 'package:get/get.dart';
import 'package:obs/app/constants/application.dart';

class ConfirmorderProviderProvider extends GetConnect {
  String get baseApi => "http://192.168.0.113:8888/obs/api/";

  Future<dynamic> orderBooks(body) async {
    final response = await post("${baseApi}orders", jsonEncode(body),
        contentType: 'application/json');
    if (response.statusCode == 200) {
      // print(response.body);
      return response.body;
    } else {
      // print(response.statusText);
      return Future.error(response.statusText!);
    }
  }
}
