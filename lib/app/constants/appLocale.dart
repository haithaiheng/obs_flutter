import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'change_lang': 'Change Language',
          'khmer': 'Khmer',
          'english': 'English',
          'welcome_back': 'Welcome Back',
          'change_password': 'Change Password',
          'my_book': 'My Books',
          'cart': 'Cart',
        },
        'kh_KM': {
          'hello': 'សួស្តី',
          'change_lang': 'ប្តូរភាសា',
          'khmer': 'ភាសាខ្មែរ',
          'english': 'អង់គ្លេស',
          'welcome_back': 'ស្វាគមន៍',
          'change_password': 'ប្តូរលេខសម្ងាត់',
          'my_book': 'សៀវភៅរបស់ខ្ញុំ',
          'cart': 'កន្ត្រក',
        }
      };
}
