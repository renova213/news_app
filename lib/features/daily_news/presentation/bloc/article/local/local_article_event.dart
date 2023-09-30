part of 'local_article_bloc.dart';

sealed class LocalArticleEvent extends Equatable {
  const LocalArticleEvent();

  @override
  List<Object> get props => [];
}

class GetSavedArticles extends LocalArticleEvent {}

class RemoveArticle extends LocalArticleEvent {
  final ArticleEntity article;
  const RemoveArticle({required this.article});

  @override
  List<Object> get props => [article];
}

class SaveArticle extends LocalArticleEvent {
  final ArticleEntity article;
  const SaveArticle({required this.article});

  @override
  List<Object> get props => [article];
}
