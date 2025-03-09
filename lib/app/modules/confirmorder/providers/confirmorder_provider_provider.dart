import 'package:get/get.dart';

class ConfirmorderProviderProvider extends GetConnect {
  String get baseApi => "http://192.168.31.75:8888/obs/api/";

  Future<dynamic> orderBooks(body) async {
    final response = await post("$baseApi/orders", body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return Future.error(response.statusText!);
    }
  }
}
