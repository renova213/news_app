import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/core/usecases/usecase.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, String> {
  final ArticleRepository articleRepository;

  const GetArticleUseCase({required this.articleRepository});

  @override
  Future<DataState<List<ArticleEntity>>> call(String params) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<List<ArticleEntity>>> call2(
      String category, String country) {
    return articleRepository.getNewsArticles(
        category: category, country: country);
  }
}
