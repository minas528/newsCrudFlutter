class News {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  News(
      {required this.author,
      required this.content,
      required this.description,
      required this.publishedAt,
      required this.source,
      required this.title,
      required this.url,
      required this.urlToImage});

  // A constructor that accepts News Json and returns an instance of News class
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['author'],
        content: json['content'],
        description: json['description'],
        publishedAt: json['publishedAt'],
        title: json['title'],
        source: Source.fromJson(json['source']),
        url: json['url'],
        urlToImage: json['urlToImage']);
  }
}

class Source {
  final String? id;
  final String? name;

  Source(this.id, this.name);

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(json['id'], json['name']);
  }
}
