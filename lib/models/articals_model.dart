class ArticalModel {
  final String? image;
  final String title;
  final String subTitle;

  ArticalModel({this.image, required this.title, required this.subTitle});
  factory ArticalModel.fromJson(json) {
    return ArticalModel(
      title: json['title'],
      subTitle: json['description'],
      image: json['urlToImage'],
    );
  }
}
