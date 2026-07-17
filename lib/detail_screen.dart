import 'package:flutter/material.dart';

import '../models/news_model.dart';

class DetailScreen extends StatelessWidget {
  final NewsModel news;

  const DetailScreen({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Berita"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if (news.imageUrl.isNotEmpty)
              Image.network(
                news.imageUrl,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 220,
                    color: Colors.grey.shade300,
                    child: const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 80,
                      ),
                    ),
                  );
                },
              )
            else
              Container(
                height: 220,
                color: Colors.grey.shade300,
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 80,
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    news.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [

                      const Icon(
                        Icons.calendar_today,
                        size: 18,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: Text(
                          news.date,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    news.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 30),

                  if (news.link.isNotEmpty)
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.link),
                        title: const Text("Sumber Berita"),
                        subtitle: Text(news.link),
                      ),
                    ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}