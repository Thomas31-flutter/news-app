import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/models/articals_model.dart';

class NewsDetails extends StatelessWidget {
  NewsDetails({super.key, required this.articalModel});
  final ArticalModel articalModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 500, // ارتفاع الصورة
            floating: false,
            pinned: true, // عشان العنوان يفضل ظاهر
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  articalModel.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 6,
                        color: Colors.black54,
                      ),
                      Shadow(
                        offset: Offset(0.5, 0.5),
                        blurRadius: 6,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              background: Image.network(
                articalModel.image.toString(),
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 40),
              onPressed: () => Get.back(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32),
                  topLeft: Radius.circular(32),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  articalModel.subTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Stack(
// children: [
// SizedBox(
// height: 700,
// width: double.infinity,
// child: Image.network(
// articalModel.image.toString(),
// fit: BoxFit.cover,
// ),
// ),
// SafeArea(
// child: Align(
// alignment: Alignment.topLeft,
// child: IconButton(
// icon: Icon(Icons.arrow_back, size: 45, color: Colors.white),
// onPressed: () {
// Get.back();
// },
// ),
// ),
// ),
// Positioned(
// bottom: 0,
// top: 300,
// left: 3,
// right: 3,
// child: SingleChildScrollView(
// child: Column(
// children: [
// Text(
// articalModel.title,
// style: TextStyle(
// color: Colors.white,
// fontSize: 32,
// fontWeight: FontWeight.bold,
// ),
// ),
// Container(
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(32),
// topRight: Radius.circular(32),
// ),
// ),
// child: Padding(
// padding: const EdgeInsets.all(16),
// child: Text(
// articalModel.subTitle,
// style: TextStyle(
// color: Colors.black,
// fontSize: 40,
// // overflow: TextOverflow.visible,
// ),
// ),
// ),
// ),
// ],
// ),
// ),
// ),
// ],
// ),
