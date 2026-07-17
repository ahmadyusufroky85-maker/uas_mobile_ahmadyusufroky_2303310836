import 'package:flutter/material.dart';

import 'models/news_model.dart';
import 'api_service.dart';
import 'news_card.dart';
import 'detail_screen.dart';

class BeritaScreen extends StatefulWidget {
  const BeritaScreen({super.key});

  @override
  State<BeritaScreen> createState() => _BeritaScreenState();
}

class _BeritaScreenState extends State<BeritaScreen> {
  late Future<List<NewsModel>> newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = ApiService.getNews();
  }

  Future<void> _refreshNews() async {
    setState(() {
      newsFuture = ApiService.getNews();
    });

    await newsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Berita"), centerTitle: true),

      body: RefreshIndicator(
        onRefresh: _refreshNews,

        child: FutureBuilder<List<NewsModel>>(
          future: newsFuture,

          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Text(
                        "Terjadi Error\n${snapshot.error}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return ListView(
                children: const [
                  SizedBox(
                    height: 500,
                    child: Center(child: Text("Tidak ada berita.")),
                  ),
                ],
              );
            }

            final newsList = snapshot.data!;

            return ListView.builder(
              padding: const EdgeInsets.all(10),

              itemCount: newsList.length,

              itemBuilder: (context, index) {
                final news = newsList[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(news: news),
                      ),
                    );
                  },

                  child: NewsCard(news: news),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
