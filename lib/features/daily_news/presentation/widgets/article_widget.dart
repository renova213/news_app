import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/features/daily_news/domain/entities/article_entity.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity article;
  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: _buildImage()),
        const SizedBox(width: 16),
        Expanded(flex: 2, child: _articleInfo()),
      ],
    );
  }

  ClipRRect _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: 150,
        child: CachedNetworkImage(
          imageUrl: article.urlToImage,
          errorWidget: (context, url, error) {
            return const Center(
              child: Icon(Icons.error, color: Colors.red),
            );
          },
          placeholder: (context, url) {
            return const CupertinoActivityIndicator();
          },
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Column _articleInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          article.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Icon(Icons.timeline_outlined, size: 16),
            Text(
              article.publishedAt,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
