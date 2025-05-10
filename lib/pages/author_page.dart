import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/book_card.dart';
import '../widgets/custom_app_bar.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
        final books = [
      {"title": "Da Vinci Code", "author": "Dan Brown"},
      {"title": "Da Vinci Code", "author": "Dan Brown"},
      {"title": "Da Vinci Code", "author": "Dan Brown"},
      {"title": "Da Vinci Code", "author": "Dan Brown"},
    ];

    return Scaffold(
      // appBar: AppBar(title: const Text("Sorted by Author")),
      appBar: const CustomAppBar(title: 'Books'),

      // body: ListView.builder(
      //   itemCount: books.length,
      //   itemBuilder: (context, index) {
      //     return BookCard(
      //       title: books[index]['title']!,
      //       author: books[index]['author']!,
      //       onTap: () {
      //         context.go('/byAuthor/detail');
      //       },
      //     );
      //   },
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              "Sorted by Author",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                return BookCard(
                  title: books[index]['title']!,
                  author: books[index]['author']!,
                  // onTap: () => context.go('/byTitle/detail'),
                  onTap: () => context.push('/byAuthor/detail'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
