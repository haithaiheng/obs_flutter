import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/modules/profile/providers/profile_provider_provider.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final _provider = ProfileProviderProvider();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  RxInt id = 0.obs;

  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void onInit() {
    final profile = Get.arguments;
    id.value = int.parse(profile['user_id']);
    firstController.text = profile['user_firstname'];
    lastController.text = profile['user_lastname'];
    bioController.text = profile['user_bio'];
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

  Future<void> updateProfile() async {
    Map<String, dynamic> map = {
      "id": id.value,
      "first": firstController.text,
      "last": lastController.text,
      "bio": bioController.text
    };
    setLoading(true);
    _provider.updateProfiles(map).then((value) {
      if (value['message'] == 'success') {
        final storage = GetStorage();
        storage.write('login', value['data'][0]);
        setLoading(false);
        Get.back(result: true);
      } else {
        print(value.toString());
        Get.snackbar("message", value['message']);
      }
      return value['message'];
    }, onError: (error) {
      Get.snackbar("message", "Request failed", snackPosition: SnackPosition.BOTTOM);
      print(error.toString());
    });
  }
}