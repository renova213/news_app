import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class SaveArticleUsecase {
  final ArticleRepository articleRepository;

  const SaveArticleUsecase({required this.articleRepository});

  Future<void> saveArticle(ArticleEntity article) async {
    await articleRepository.saveArticle(article);
  }
}
