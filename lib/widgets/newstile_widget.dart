import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/models/articals_model.dart';
import 'package:newsapp/screens/newsdetails_screen.dart';

class Newstile extends StatelessWidget {
  const Newstile({super.key, required this.articalModel});
  final ArticalModel articalModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(NewsDetails(articalModel: articalModel));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                articalModel.image ?? "assets/buisness.jpeg",
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Text(
              articalModel.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Text(
              articalModel.subTitle,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
