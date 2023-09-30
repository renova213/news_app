import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_source/local/app_database.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article_model.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService newsApiService;
  final AppDatabase appDatabase;
  const ArticleRepositoryImpl(
      {required this.newsApiService, required this.appDatabase});

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles(
      {required String country, required String category}) async {
    try {
      final httpResponse = await newsApiService.getNewsArticles(
          apikey: apiKey, country: country, category: category);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() async {
    return await appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> saveArticle(ArticleEntity article) async {
    return await appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> removeArticle(ArticleEntity article) async {
    return await appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }
}
