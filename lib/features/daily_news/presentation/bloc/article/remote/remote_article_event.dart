part of 'remote_article_bloc.dart';

sealed class RemoteArticleEvent extends Equatable {
  const RemoteArticleEvent();

  @override
  List<Object> get props => [];
}

class GetArticle extends RemoteArticleEvent {
  final String category;
  final String country;
  const GetArticle({required this.category, required this.country});
  @override
  List<Object> get props => [category, country];
}
