import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String author;
  final VoidCallback onTap;

  const BookCard({
    super.key,
    required this.title,
    required this.author,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   color: const Color(0xFFFDF6FF),
    //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //   child: ListTile(
    //     title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    //     subtitle: Text(author),
    //     onTap: onTap,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   ),
    // );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFFDF6FF),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.normal)),
            const SizedBox(height: 4),
            Text(
              author,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
