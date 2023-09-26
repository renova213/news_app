part of 'remote_article_bloc.dart';

sealed class RemoteArticleEvent extends Equatable {
  final String? category;
  final String? country;
  const RemoteArticleEvent(this.category, this.country);

  @override
  List<Object> get props => [category!, country!];
}

class GetArticle extends RemoteArticleEvent {
  const GetArticle(String category, String country) : super(category, country);
}
