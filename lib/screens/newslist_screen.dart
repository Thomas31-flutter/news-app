import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/models/articals_model.dart';
import 'package:newsapp/widgets/newstile_widget.dart';

class NewslistScreen extends StatelessWidget {
  NewslistScreen({super.key, required this.articalModel});

  final List<ArticalModel> articalModel;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articalModel.length, (
        context,
        index,
      ) {
        return Newstile(articalModel: articalModel[index]);
      }),
    );
  }
}
