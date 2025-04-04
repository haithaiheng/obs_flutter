import 'package:get/get.dart';

import '../../../constants/application.dart';

class ResetpasswordProvider extends GetConnect {

  Future<dynamic> reset(String password, String email)async {
    try{
      final response =
      await post("${application.apiBaseUrl}resetpassword", {'email': email,'password': password});
      if (response.statusCode == 200) {
        final message = response.body['message'];
        if (message == 'success') {
          return response.body;
        }else {
          return message;
        }
      }else if (response.statusCode ==404){
        return 'bad request';
      }else{
        return "connectionError";
      }
    }catch(e){
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
