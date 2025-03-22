import 'package:get/get.dart';

class MybookProvider extends GetConnect {
  Future<dynamic> fetchMybook(int userid, int pageid) async {
    try {
      var body = {'userid': userid, 'page': pageid};
      final response =
          await post("http://116.212.146.111/obs/api/mybooks", body);
      if (response.statusCode == 200) {
        final message = response.body['message'];
        if (message == 'success') {
          return response.body;
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
