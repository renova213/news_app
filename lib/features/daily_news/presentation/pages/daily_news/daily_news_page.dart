import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/widgets/article_widget.dart';

class DailyNewsPage extends StatefulWidget {
  const DailyNewsPage({super.key});

  @override
  State<DailyNewsPage> createState() => _DailyNewsPageState();
}

class _DailyNewsPageState extends State<DailyNewsPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () async => BlocProvider.of<RemoteArticleBloc>(context)
          .add(const GetArticle("general", "us")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(centerTitle: true, title: const Text("Daily News"));
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
          if (state is RemoteArticleLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is RemoteArticleError) {
            return const Center(child: Icon(Icons.refresh));
          }
          if (state is RemoteArticleDone) {
            return ListView.separated(
                separatorBuilder: (context, _) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final data = state.articles![index];
                  return ArticleWidget(article: data);
                },
                itemCount: state.articles!.length);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
