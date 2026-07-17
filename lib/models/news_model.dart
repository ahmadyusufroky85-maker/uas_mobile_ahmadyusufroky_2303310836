class NewsModel {
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String link;

  const NewsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.link,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: _stringValue(json['title'] ?? json['headline'] ?? json['name']),

      description: _stringValue(
        json['description'] ??
            json['summary'] ??
            json['content'] ??
            json['body'],
      ),

      imageUrl: _stringValue(
        json['image'] ??
            json['image_url'] ??
            json['thumbnail'] ??
            json['imageUrl'],
      ),

      date: _stringValue(
        json['published'] ??
            json['published_at'] ??
            json['date'] ??
            json['pub_date'],
      ),

      link: _stringValue(json['url'] ?? json['link']),
    );
  }

  static String _stringValue(dynamic value) {
    if (value == null) {
      return "";
    }

    return value.toString();
  }
}
