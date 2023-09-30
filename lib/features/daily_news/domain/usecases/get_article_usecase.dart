import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase {
  final ArticleRepository articleRepository;

  const GetArticleUseCase({required this.articleRepository});

  Future<DataState<List<ArticleEntity>>> getArticles(
      {required String category, required String country}) {
    return articleRepository.getNewsArticles(
        category: category, country: country);
  }
}
