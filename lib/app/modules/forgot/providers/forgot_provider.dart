import 'package:get/get.dart';

import '../../../constants/application.dart';

class ForgotProvider extends GetConnect {
  Future<dynamic> forgot(String email) async{
    try {
      final response =
      await post("${application.apiBaseUrl}forgot", {'email': email});
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
    } catch (e) {
      print(e.toString());
      return "Fetching Error";
    }
  }
}
