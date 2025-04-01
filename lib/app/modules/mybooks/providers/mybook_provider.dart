import 'package:get/get.dart';
import 'package:obs/app/constants/application.dart';

class MybookProvider extends GetConnect {
  Future<dynamic> fetchMybook(int userid, int pageid) async {
    try {
      var body = {'id': userid, 'page': pageid};
      final response =
          await post("${application.apiBaseUrl}mybooks", body);
      if (response.statusCode == 200) {
        final message = response.body['message'];
        if (message == 'success') {
          return response.body;
        } else if (message == 'unfound') {
          return 'empty';
        } else {
          return 'argument missing';
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
