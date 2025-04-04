import 'package:get/get.dart';

import '../../../constants/application.dart';

class SigninProvider extends GetConnect {
  Future<dynamic> login(String email, String Password) async{
    try {
      var body = {'email': email, 'password': Password};
      final response =
      await post("${application.apiBaseUrl}signin", body);
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
        // if (response.status.connectionError){
        return "connectionError";
        // }
      }
    } catch (e) {
      print(e.toString());
      return "Fetching Error";
    }
  }
}
