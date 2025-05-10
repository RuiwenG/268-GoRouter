import 'package:flutter/material.dart';

class ByTitlePage extends StatelessWidget {
  const ByTitlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Books"), centerTitle: true),
      body: Center(child: Text("Title")),
    );
  }
}
