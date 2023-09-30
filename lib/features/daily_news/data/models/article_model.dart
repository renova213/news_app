import 'package:floor/floor.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';

@Entity(tableName: 'article', primaryKeys: ['publishedAt'])
class ArticleModel extends ArticleEntity {
  const ArticleModel(
      {required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.content,
      required super.publishedAt,
      required super.urlToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      content: json['content'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      urlToImage: json['urlToImage'] ??
          "https://storage.googleapis.com/proudcity/mebanenc/uploads/2021/03/placeholder-image.png");

  factory ArticleModel.fromEntity(ArticleEntity entity) => ArticleModel(
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      content: entity.content,
      publishedAt: entity.publishedAt,
      urlToImage: entity.urlToImage);
}
