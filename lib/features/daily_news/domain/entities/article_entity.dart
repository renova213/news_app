import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const ArticleEntity(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.content,
      required this.publishedAt,
      required this.urlToImage});

  @override
  List<Object?> get props =>
      [author, title, description, url, content, publishedAt, url];
}
