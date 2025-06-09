import 'package:flutter/material.dart';
import '../models/articals_model.dart';
import '../services/getnews_service.dart';
import 'newslist_screen.dart';

class Newslistbuilder extends StatefulWidget {
  const Newslistbuilder({super.key, required this.category});
  final String category;
  @override
  State<Newslistbuilder> createState() => _NewslistbuilderState();
}

class _NewslistbuilderState extends State<Newslistbuilder> {
  var request;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    request = NewsServices().getNews(category: widget.category);
  }
  // not need this below
  // Future<void> getGeneralNews() async {
  //   request = await NewsServices().getNews();
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticalModel>>(
      future: request,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return NewslistScreen(articalModel: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Oops , there is an error , try again later",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
