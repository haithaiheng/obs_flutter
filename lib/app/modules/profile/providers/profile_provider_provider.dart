import 'package:get/get.dart';
import 'package:obs/app/constants/application.dart';

class ProfileProviderProvider extends GetConnect {
  Future<dynamic> updateProfiles(body) async {
    final response = await post("${application.apiBaseUrl}profile", body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return Future.error(response.statusText!);
    }
  }
}
