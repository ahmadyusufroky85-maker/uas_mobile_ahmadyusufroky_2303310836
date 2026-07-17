import 'package:flutter/material.dart';
import 'models/news_model.dart';
import 'news_card.dart';
import 'detail_screen.dart';

class MoviesList extends StatelessWidget {
  final List<NewsModel> newsList;

  const MoviesList({super.key, required this.newsList});

  @override
  Widget build(BuildContext context) {
    if (newsList.isEmpty) {
      return const Center(
        child: Text(
          "Data berita tidak tersedia.",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        final news = newsList[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailScreen(news: news)),
            );
          },
          child: NewsCard(news: news),
        );
      },
    );
  }
}
