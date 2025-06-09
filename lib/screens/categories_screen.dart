import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/screens/newslistbuilder.dart';

import 'home_screen.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 45),
          onPressed: () {
            Get.back(result: HomeScreen());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(slivers: [Newslistbuilder(category: category)]),
      ),
    );
  }
}
