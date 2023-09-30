import 'package:floor/floor.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @Query("SELECT * FROM article")
  Future<List<ArticleModel>> getArticles();

  @delete
  Future<void> deleteArticle(ArticleModel article);

  @Insert()
  Future<void> insertArticle(ArticleModel article);
}
