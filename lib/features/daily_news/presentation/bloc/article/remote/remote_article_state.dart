part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? dioException;
  const RemoteArticleState({this.articles, this.dioException});

  @override
  List<Object> get props => [articles!, dioException!];
}

final class RemoteArticleLoading extends RemoteArticleState {}

final class RemoteArticleDone extends RemoteArticleState {
  const RemoteArticleDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

final class RemoteArticleError extends RemoteArticleState {
  const RemoteArticleError(DioException dioException)
      : super(dioException: dioException);
}
