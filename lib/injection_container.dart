import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/remote/news_api_service.dart';
import 'package:news_app_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Dependencies
  sl.registerLazySingleton<NewsApiService>(() => NewsApiService(sl()));

  sl.registerLazySingleton<ArticleRepository>(
      () => ArticleRepositoryImpl(newsApiService: sl()));

  // Usecases
  sl.registerLazySingleton<GetArticleUseCase>(
      () => GetArticleUseCase(articleRepository: sl()));

  // Blocs
  sl.registerFactory<RemoteArticleBloc>(
      () => RemoteArticleBloc(getArticleUseCase: sl()));
}
