import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:obs/app/constants/application.dart';
import 'package:obs/app/modules/book_details/models/books_detail_model.dart';

import '../../cart/controllers/cart_controller.dart';

class BookDetailsController extends GetxController {
  final _apiUrl = Application();
  final _dio = Dio();

  final Rx<BookDetailsModel> book = BookDetailsModel().obs;
  final _cartController = Get.put(CartController());

  RxBool isLoading = RxBool(true);
  RxString isError = RxString("");
  RxBool isShowDes = RxBool(false);
  RxBool isShowComments = RxBool(false);
  RxBool isOrdered = false.obs;
  RxBool addCart = false.obs;

  final count = 0.obs;
  RxString uid = ''.obs;
  final storage = GetStorage();
  var _userid = "0";


  @override
  void onInit() async{
    getId();

    getUserId();
    final bookId = Get.arguments;
    if (bookId == null){
      isError("Book Id is not found");
    }else{
      print(bookId);
      await getBook(int.parse(bookId));
    }
    readFromCart();
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

  void getUserId(){
    final user = storage.read('login');
    uid.value = user['user_id'];
    update();
  }

  // Method to fetch book details
  Future<void> getBook(int id) async {
    isLoading(true);
    isError.value = "";
    try {
      var body = {'id': id, 'uid': uid.value};
      final response =
          await _dio.get('${_apiUrl.apiBaseUrl}bookdetail', data: body, options: Options(headers: {'Content-Type':'application/json'}));
      if (response.statusCode == 200) {

        // var rawData = jsonDecode(response.data);
        final rawData = response.data;
        if (rawData['data'] != null) {
          book.value = BookDetailsModel.fromJson(rawData);
          isOrdered.value = rawData['data']['ordered'];
          // print(book.value);
        } else {
          isError.value = "No data found";
        }
        update();
      } else {
        isLoading(false);
        isError('Failed to load book');
        print("Failed to load book: ${response.statusCode}");
        update();
      }
    } catch (e) {
      isError.value = "Failed to load book details: $e";
      isLoading(false);
      print("Exception: $e");
      update();
    } finally {
      isLoading(false);
    }
  }

//   handle des
  void showDes() {
    update();
    isShowDes.value = !isShowDes.value;
  }

  void showComments() => isShowComments.value = !isShowComments.value;

  void addToCart(){
    var data = {
      "bookid": num.parse(book.value.datas!.bookId!),
      "title": book.value.datas!.bookTitle,
      "category": book.value.datas!.cateTitle,
      "price": num.parse(book.value.datas!.bookPrice!),
      "thumbnail":
      book.value.datas!.bookThumbnail
    };
    _cartController.addToCart(data);
    addCart(true);
    update();
  }

  void getId(){
    final isLogin = storage.read('login');
    _userid = isLogin['user_id'];
  }

  Future<void> readFromCart() async {
    List<dynamic> stored = [];
    var data = {
      "bookid": num.parse(book.value.datas!.bookId!),
      "title": book.value.datas!.bookTitle,
      "category": book.value.datas!.cateTitle,
      "price": num.parse(book.value.datas!.bookPrice!),
      "thumbnail":
      book.value.datas!.bookThumbnail
    };
    final cart = await storage.read('cart.$_userid');
    if (cart != null){
      stored = cart;
    }
    if (stored.contains(jsonEncode(data))) {
      addCart(true);
    }
    update();
  }
}
