import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:obs/app/Models/category_model.dart';
import 'package:obs/colors/constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColors,
      appBar: _appbar(),
      body: controller.obx(
        (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final categ = data[index];
              final books = categ.books ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20, top: index == 0 ? 10 : 0),
                    child: Text(
                      "${categ.name}",
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
                        print("This is: ${book}");
                        return Padding(
                          padding: EdgeInsets.only(
                              right: index == books.length - 1 ? 20 : 0,
                              left: 20,
                              top: 10,
                              bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              // if (book['id'] != null) {
                              //   Get.toNamed('/book-details', arguments: {
                              //     'id': 1,
                              //     'title': "KK",
                              //   });
                              // } else {
                              //   print("Book ID is null");
                              // }
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
          );
        },
        onLoading: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        onEmpty: Center(
          child: Text("No data!"),
        ),
        onError: (erro) => Center(
          child: Text(erro.toString()),
        ),
      ),
    );
  }

  _appbar() {
    return AppBar(
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/profiles.png"),
          ),
          const SizedBox(width: 10),
          Text(
            "${'hello'.tr}!, Jonh",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            // Handle search action
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
  _cardBookViews({
    super.key,
    required this.book,
  });

  final Books book;

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
              clipBehavior: Clip.none,
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Image.network(
                  //   '${book['thumbnail']}',
                  //   width: 180,
                  //   height: 200,
                  //   fit: BoxFit.cover,
                  // ),
                  Positioned(
                    right: -10,
                    top: -10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedFavourite,
                          color: Colors.red,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Title",
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
                    "Author",
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
                    'cate',
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
                    '\$ price',
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
                          "racting",
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
