import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel(
      {required super.id,
      required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.content,
      required super.publishedAt,
      required super.urlToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      id: json['id'] ?? 0,
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      content: json['content'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      urlToImage: json['urlToImage'] ??
          "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png");
}
