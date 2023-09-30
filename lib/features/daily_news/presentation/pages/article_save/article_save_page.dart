import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/article_detail/article_detail_page.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/widgets/article_widget.dart';

class ArticleSavePage extends StatefulWidget {
  const ArticleSavePage({super.key});

  @override
  State<ArticleSavePage> createState() => _ArticleSavePageState();
}

class _ArticleSavePageState extends State<ArticleSavePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<LocalArticleBloc>(context).add(GetSavedArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: const Text("Saved Articles"),
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.keyboard_arrow_left)),
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: BlocBuilder<LocalArticleBloc, LocalArticleState>(
        builder: (_, state) {
          if (state is LocalArticleLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (state is LocalArticleDone) {
            return ListView.separated(
                separatorBuilder: (context, _) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final data = state.articles[index];
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ArticleDetailPage(article: data)),
                                ),
                            child: ArticleWidget(article: data)),
                      ),
                      _buildRemoveArticleIcon(data),
                    ],
                  );
                },
                itemCount: state.articles.length);
          }
          return const SizedBox();
        },
      ),
    );
  }

  GestureDetector _buildRemoveArticleIcon(ArticleEntity article) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<LocalArticleBloc>(context)
            .add(RemoveArticle(article: article));
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(Icons.remove_circle_outline, color: Colors.red),
      ),
    );
  }
}
