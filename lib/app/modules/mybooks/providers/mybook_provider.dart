import 'package:get/get.dart';

class MybookProvider extends GetConnect {
  Future<dynamic> fetchMybook() async {
    try {
      var body = {'userid': 1, 'page': 1};
      final response =
          await post("http://116.212.146.111/obs/api/mybooks", body);
      if (response.statusCode == 200) {
        final message = response.body['message'];
        if (message == 'success') {
          return response.body['datas'];
        } else {
          return 'invalid';
        }
      }
    } catch (e) {
      print(e.toString());
      return e;
    }
  }
}
