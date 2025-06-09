import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/models/pageview_model.dart';
import '../screens/categories_screen.dart';

class CategoryListScreen extends StatelessWidget {
  CategoryListScreen({
    super.key,
    required this.pageViewController,
    required this.categories,
    required this.currentPage,
  });

  final PageController pageViewController;
  final List<CategoryModel> categories;
  final RxInt currentPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: () {
          Get.to(
            CategoriesScreen(
              category: categories[currentPage.value].categoryName,
            ),
          );
        },
        child: PageView.builder(
          controller: pageViewController,
          itemCount: categories.length,
          onPageChanged: (index) {
            currentPage.value = index;
          },
          itemBuilder: (context, index) {
            return Obx(
              () => Transform.scale(
                scale: currentPage == index ? 1.2 : 0.8,
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: Image.asset(
                        categories[index].categoryImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      categories[index].categoryName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
