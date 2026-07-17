import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/news_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<News>> futureNews;

  // Fungsi untuk mengambil data dari API publik JSONPlaceholder
  Future<List<News>> fetchNews() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => News.fromJson(data)).toList();
    } else {
      throw Exception('Gagal memuat berita dari API');
    }
  }

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Berita Terbaru (API)"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: FutureBuilder<List<News>>(
          future: futureNews,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ExpansionTile(
                      title: Text(
                        snapshot.data![index].title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(snapshot.data![index].body),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
