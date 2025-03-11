import 'package:get/get.dart';
import 'package:obs/app/Models/category_model.dart';

class CategoryProvider extends GetConnect {
  Future<List<CategoriesModel>> getCategories() async {
    final response = await get("http://192.168.240.82:8000/api/categories");

    if (response.status.hasError) {
      return Future.error(response.statusText ?? "Failed to fetch categories");
    } else {
      List<dynamic> data = response.body ?? [];
      return data.map((e) => CategoriesModel.fromJson(e)).toList();
    }
  }
}
