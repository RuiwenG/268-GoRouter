import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Book"),
        backgroundColor: const Color(0xFFFDF6FF),
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        actions: [
          IconButton(icon: const Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),

      body: const Padding(
        padding: EdgeInsets.all(32),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Detail of the Book",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
