import 'package:dio/dio.dart';
import 'package:newsapp/models/articals_model.dart';

class NewsServices {
  final dio = Dio();
  Future<List<ArticalModel>> getNews({required String category}) async {
    var response = await dio.get(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=9a55af9472a94f84824939389a0729b7&category=$category",
    );
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> articles = jsonData['articles'];
    List<ArticalModel> articleList = [];
    for (var article in articles) {
      ArticalModel articalModel = ArticalModel.fromJson(article);
      articleList.add(articalModel);
    }
    return articleList;
  }
}
