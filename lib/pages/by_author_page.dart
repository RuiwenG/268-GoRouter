import 'package:flutter/material.dart';
import 'package:hw4/navigation/book_router.dart';
import 'package:hw4/widgets/book_card.dart';
import 'package:go_router/go_router.dart';

class ByAuthorPage extends StatelessWidget {
  const ByAuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = [
      {"title": "Da Vinci Code", "author": "Dan Brown"},
      {"title": "Da Vinci Code", "author": "Dan Brown"},
      {"title": "Da Vinci Code", "author": "Dan Brown"},
      {"title": "Test to see sorted", "author": "A Test"},
    ];
    // sort by author
    books.sort((a, b) => a['author']!.compareTo(b['author']!));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        title: Text("Books"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Sorted by Author",
              style: TextStyle(
                fontSize: 30,
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
                  onTap: () => context.goNamed(RouteName.byAuthorDetail),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
