import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class GetSavedArticleUsecase {
  final ArticleRepository articleRepository;

  const GetSavedArticleUsecase({required this.articleRepository});

  Future<List<ArticleEntity>> getSavedArticles() async {
    return await articleRepository.getSavedArticles();
  }
}
