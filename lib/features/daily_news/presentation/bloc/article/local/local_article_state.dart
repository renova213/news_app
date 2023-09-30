part of 'local_article_bloc.dart';

sealed class LocalArticleState extends Equatable {
  const LocalArticleState();

  @override
  List<Object> get props => [];
}

final class LocalArticleLoading extends LocalArticleState {}

final class LocalArticleFailed extends LocalArticleState {
  final String errorMessage;
  const LocalArticleFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class LocalArticleDone extends LocalArticleState {
  final List<ArticleEntity> articles;

  const LocalArticleDone({required this.articles});

  @override
  List<Object> get props => [articles];
}
