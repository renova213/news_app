import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/usecases/save_article_usecase.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUsecase getSavedArticleUsecase;
  final RemoveArticleUsecase removeArticleUsecase;
  final SaveArticleUsecase saveArticleUsecase;

  LocalArticleBloc(
      {required this.getSavedArticleUsecase,
      required this.removeArticleUsecase,
      required this.saveArticleUsecase})
      : super(LocalArticleLoading()) {
    on<GetSavedArticles>(_onGetSavedArticles);
    on<RemoveArticle>(_onRemoverticles);
    on<SaveArticle>(_onSaveArticles);
  }

  Future<void> _onGetSavedArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await getSavedArticleUsecase.getSavedArticles();
    emit(LocalArticleDone(articles: articles));
  }

  Future<void> _onRemoverticles(
      RemoveArticle event, Emitter<LocalArticleState> emit) async {
    await removeArticleUsecase.removeArticle(event.article);
    await _onGetSavedArticles(GetSavedArticles(), emit);
  }

  Future<void> _onSaveArticles(
      SaveArticle event, Emitter<LocalArticleState> emit) async {
    final state = this.state;
    if (state is LocalArticleDone) {
      final contain =
          state.articles.where((e) => e == event.article).toList().isEmpty;

      if (contain == true) {
        await saveArticleUsecase.saveArticle(event.article);
        await _onGetSavedArticles(GetSavedArticles(), emit);
      } else {
        emit(const LocalArticleFailed(
            errorMessage: "This article has already been added"));
      }
    }
  }
}
