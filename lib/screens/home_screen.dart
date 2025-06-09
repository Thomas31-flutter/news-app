import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/models/pageview_model.dart';
import 'package:newsapp/screens/newslistbuilder.dart';
import '../widgets/pageview_widget.dart';
import '../widgets/richtextappbar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final pageViewController = PageController(viewportFraction: 0.7);
  var currentPage = 0.obs;
  final List<CategoryModel> categories = [
    CategoryModel("business", "assets/buisness.jpeg"),
    CategoryModel("sports", "assets/sports.jpeg"),
    CategoryModel("health", "assets/health.jpeg"),
    CategoryModel("science", "assets/downloadenter.jpeg"),
    CategoryModel("technology", "assets/download (3).jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: RichtextappbarWidget(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SliverToBoxAdapter(
              child: CategoryListScreen(
                pageViewController: pageViewController,
                categories: categories,
                currentPage: currentPage,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                "Generals",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Newslistbuilder(category: 'general'),
          ],
        ),
      ),
    );
  }
}

// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   spacing: 20,
//   children: [
//     Text(
//       "Categories",
//       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//     ),
//     pageview_widget(
//       pageViewController: pageViewController,
//       categories: categories,
//       currentPage: currentPage,
//     ),
//     Text(
//       "Generals",
//       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//     ),
//     Expanded(child: NewslistScreen()),
//   ],
// ),
