import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_article_usecase.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase getArticleUseCase;
  RemoteArticleBloc({required this.getArticleUseCase})
      : super(RemoteArticleLoading()) {
    on<GetArticle>(onGetArticle);
  }

  Future<void> onGetArticle(
      GetArticle event, Emitter<RemoteArticleState> emit) async {
    final dataState = await getArticleUseCase.getArticles(
        category: event.category, country: event.country);
    if (dataState is DataSuccess) {
      emit(RemoteArticleDone(articles: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticleError(dioException: dataState.exception!));
    }
  }
}
