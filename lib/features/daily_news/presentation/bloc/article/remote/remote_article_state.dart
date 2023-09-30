part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  const RemoteArticleState();

  @override
  List<Object> get props => [];
}

final class RemoteArticleLoading extends RemoteArticleState {}

final class RemoteArticleDone extends RemoteArticleState {
  final List<ArticleEntity> articles;
  const RemoteArticleDone({required this.articles});

  @override
  List<Object> get props => [articles];
}

final class RemoteArticleError extends RemoteArticleState {
  final DioException dioException;
  const RemoteArticleError({required this.dioException});

  @override
  List<Object> get props => [dioException];
}
