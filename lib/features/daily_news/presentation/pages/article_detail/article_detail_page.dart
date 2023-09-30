import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';

class ArticleDetailPage extends StatelessWidget {
  final ArticleEntity article;
  const ArticleDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _buildFloatingActionButton(context),
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.keyboard_arrow_left)),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndDate(),
          _buildArticleImage(),
          _buildArticleDescription(),
        ],
      ),
    );
  }

  Padding _buildArticleTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(article.title,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.calendar_month, size: 16),
              const SizedBox(width: 4),
              Text(article.publishedAt, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }

  Container _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(article.urlToImage, fit: BoxFit.cover),
    );
  }

  Padding _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Text(
        '${article.description}\n\n${article.content}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  BlocListener _buildFloatingActionButton(BuildContext context) {
    return BlocListener<LocalArticleBloc, LocalArticleState>(
      listener: (context, state) {
        if (state is LocalArticleDone) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.black,
              content: Text('Article saved successfully.'),
            ),
          );
        }
        if (state is LocalArticleFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black,
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          BlocProvider.of<LocalArticleBloc>(context)
              .add(SaveArticle(article: article));
        },
        child: const Icon(Icons.bookmark, color: Colors.white),
      ),
    );
  }
}
