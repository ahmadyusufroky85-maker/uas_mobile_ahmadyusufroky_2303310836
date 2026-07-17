import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/news_model.dart';

class ApiService {
  static const String url = "http://localhost/mobile_uas_api/news_api.php";

  static Future<List<NewsModel>> getNews() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      final List news = jsonData["news"];

      return news.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}
