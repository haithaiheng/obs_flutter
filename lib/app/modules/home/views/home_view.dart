// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:obs/app/modules/buttomnavigationbaritems/views/buttomnavigationbaritems_view.dart';

import 'package:obs/colors/constants.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  final List<Map<String, String>> category = [
    {"id": "1", "name": "Electronics", "icon": "📱"},
    {"id": "2", "name": "Fashion", "icon": "👗"},
    {"id": "3", "name": "Home & Kitchen", "icon": "🏠"},
    {"id": "4", "name": "Sports", "icon": "🏀"},
    {"id": "5", "name": "Beauty", "icon": "💄"},
    {"id": "6", "name": "Toys", "icon": "🧸"},
    {"id": "7", "name": "Automotive", "icon": "🚗"},
    {"id": "8", "name": "Books", "icon": "📚"},
    {"id": "9", "name": "Music", "icon": "🎵"},
    {"id": "10", "name": "Health & Personal Care", "icon": "💊"},
  ];

  final books = [
    {
      'id': 1,
      'title': 'The Great Gatsby',
      'author': 'F. Scott Fitzgerald',
      'category': 'Classic',
      'price': 10.99,
      'rating': 4.5,
      'description': 'A novel about the American dream set in the 1920s.',
      'pdf_url': 'https://example.com/gatsby.pdf',
      'thumbnail':
          'https://dm989u341afjd.cloudfront.net/wp-content/uploads/2021/01/11140621/B00ZDAN928.01.LZZZZZZZ.jpg',
      'created_at': '2025-03-01 10:00:00',
      'updated_at': '2025-03-01 10:00:00',
    },
    {
      'id': 2,
      'title': '1984',
      'author': 'George Orwell',
      'category': 'Dystopian',
      'price': 12.99,
      'rating': 4.8,
      'description': 'A chilling portrayal of a totalitarian society.',
      'pdf_url': 'https://example.com/1984.pdf',
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6-TaNbD1XkuUCSRvZOBmHdUtbtqm-tAHScw&s',
      'created_at': '2025-03-02 12:00:00',
      'updated_at': '2025-03-02 12:00:00',
    },
    {
      'id': 3,
      'title': 'To Kill a Mockingbird',
      'author': 'Harper Lee',
      'category': 'Fiction',
      'price': 8.99,
      'rating': 4.7,
      'description': 'A story of race and justice in the American South.',
      'pdf_url': 'https://example.com/mockingbird.pdf',
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5JbD66d7lgXFxVElNjRehV_F--q1zEnqcQA&s',
      'created_at': '2025-03-03 14:00:00',
      'updated_at': '2025-03-03 14:00:00',
    },
    {
      'id': 4,
      'title': 'The Catcher in the Rye',
      'author': 'J.D. Salinger',
      'category': 'Classic',
      'price': 9.99,
      'rating': 4.4,
      'description': 'A novel about adolescent alienation and rebellion.',
      'pdf_url': 'https://example.com/catcher.pdf',
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDzSIq7dGokYdYmlJBRmFWfZojHx7LSqy1eA&s',
      'created_at': '2025-03-04 16:00:00',
      'updated_at': '2025-03-04 16:00:00',
    },
    {
      'id': 5,
      'title': 'Moby Dick',
      'author': 'Herman Melville',
      'category': 'Adventure',
      'price': 11.99,
      'rating': 4.3,
      'description': 'The epic tale of the pursuit of the elusive white whale.',
      'pdf_url': 'https://example.com/mobydick.pdf',
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgA0kNyXUrmouVwSh7VZFWOhDnNnpr5dM0qg&s',
      'created_at': '2025-03-05 18:00:00',
      'updated_at': '2025-03-05 18:00:00',
    },
    {
      'id': 6,
      'title': 'The Hobbit',
      'author': 'J.R.R. Tolkien',
      'category': 'Fantasy',
      'price': 14.99,
      'rating': 4.9,
      'description':
          'The adventure of Bilbo Baggins, a hobbit who goes on an unexpected journey.',
      'pdf_url': 'https://example.com/hobbit.pdf',
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSL9uJojKyuYXwKRcgIcYRFy1Np0_tg8DzhAly3zg1iG1IjTdCjOMRi82hCv17USV0YNzw&usqp=CAU',
      'created_at': '2025-03-06 20:00:00',
      'updated_at': '2025-03-06 20:00:00',
    },
    {
      'id': 7,
      'title': 'Pride and Prejudice',
      'author': 'Jane Austen',
      'category': 'Romance',
      'price': 7.99,
      'rating': 4.6,
      'description': 'A classic novel about love, marriage, and society.',
      'pdf_url': 'https://example.com/prideandprejudice.pdf',
      'thumbnail':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA2cn6VYg1hFLbcaqFmWTmWTwKJSa3ZNBxCQ&s',
      'created_at': '2025-03-07 22:00:00',
      'updated_at': '2025-03-07 22:00:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColors,
      appBar: _appbar(),
      body: ListView.builder(
        itemCount: category.length,
        itemBuilder: (context, index) {
          final categs = category[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: index == 0 ? 10 : 0),
                child: Text(
                  categs['name'].toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // List App
              SizedBox(
                height: 380,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == books.length - 1 ? 20 : 0,
                          left: 20,
                          top: 10,
                          bottom: 10),
                      child: GestureDetector(
                        onTap: () {
                          // -------
                          print("This is Cart: ${index}");

                          if (book['id'] != null) {
                            Get.toNamed('/book-details', arguments: {
                              'id': book['id'],
                              'title': book['title'],
                            });
                          } else {
                            print("Book ID is null");
                          }
                        },
                        child: _cardBookViews(book: book),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: ButtomnavigationbaritemsView(),
    );
  }

// Block Card
  _appbar() {
    return AppBar(
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/profiles.png"),
          ),
          const SizedBox(width: 10),
          const Text(
            "Hi!, Jonh",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            //
          },
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            color: dangerDark,
            size: 24.0,
          ),
        ),
      ],
    );
  }
}

class _cardBookViews extends StatelessWidget {
  const _cardBookViews({
    // ignore: unused_element
    super.key,
    required this.book,
  });

  final Map<String, Object> book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                '${book['thumbnail']}',
                width: 180,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${book['title']}",
              style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedUserAccount,
                  color: dangerDark,
                  size: 20.0,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    book['author'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontFamily: "Poppins"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedBook01,
                  color: dangerDark,
                  size: 20.0,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    book['category'].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.grey.shade600,
                        fontSize: 12,
                        fontFamily: "Poppins"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '\$${book['price']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: dangerDark,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis, // Truncate text with "..."
                    maxLines: 1, // Ensures text remains on a single line
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: dangerDark,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amberAccent,
                          size: 22,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${book['rating']}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
