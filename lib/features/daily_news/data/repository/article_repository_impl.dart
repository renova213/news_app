import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/models/article_model.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/remote/news_api_service.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService newsApiService;
  const ArticleRepositoryImpl({required this.newsApiService});

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
}
