import 'package:get/get.dart';
import 'package:obs/app/modules/profile/providers/profile_provider_provider.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final _provider = ProfileProviderProvider();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setLoading(bool loadingValue) {
    _isLoading = loadingValue;
    update();
  }

  Future<void> updateProfile(body) async {
    setLoading(true);
    _provider.updateProfiles(body).then((value) {
      if (value['message'] == 'success') {
        setLoading(false);
        Get.back();
      } else {
        Get.snackbar("message", value['message']);
      }
      return value['message'];
    }, onError: (error) {
      setLoading(false);
      Get.snackbar("message", "Request failed");
      print(error.toString());
    });
  }
}
