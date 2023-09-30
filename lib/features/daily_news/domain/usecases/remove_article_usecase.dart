import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUsecase {
  final ArticleRepository articleRepository;

  const RemoveArticleUsecase({required this.articleRepository});

  Future<void> removeArticle(ArticleEntity article) async {
    await articleRepository.removeArticle(article);
  }
}
