import 'package:get/get.dart';
import 'package:obs/app/constants/application.dart';

class SignupProvider extends GetConnect {
  Future<dynamic> signup(Map body) async {
    try {
      final response = await post("${application.apiBaseUrl}signup", body);
      if (response.statusCode == 200) {
        final message = response.body['message'];
        if (message == 'add') {
          return response.body;
        } else {
          return message;
        }
      } else if (response.statusCode == 404) {
        return 'bad request';
      } else {
        return "connectionError";
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
