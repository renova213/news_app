import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/config/themes/app_themes.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app_clean_architecture/features/daily_news/presentation/pages/daily_news/daily_news_page.dart';
import 'package:news_app_clean_architecture/injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RemoteArticleBloc(getArticleUseCase: sl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNewsPage(),
      ),
    );
  }
}
