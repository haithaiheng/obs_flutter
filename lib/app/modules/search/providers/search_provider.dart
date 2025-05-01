import 'package:get/get.dart';

import '../../../constants/application.dart';

class SearchProvider extends GetConnect {
  Future<dynamic> search(String txt, int pageid) async {
    try {
      var body = {'s': txt, 'page': pageid};
      final response =
      await post("${application.apiBaseUrl}search", body);
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
