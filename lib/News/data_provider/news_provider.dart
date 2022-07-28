import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/News/model/news.dart';

class NewsProvider {
  final http.Client httpClient;
  final _baseURL =
      "https://newsapi.org/v2/everything?q=meta&from=2022-06-28&sortBy=publishedAt&apiKey=8dc352263de44e5aaa480a9d32095b1b";

  NewsProvider({required this.httpClient});

  // Make an api call to get all the news about tesla
  Future<List<News>> getNewsList() async {
    final response = await httpClient.get(
      Uri.parse(_baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.body);
    // Check the status code of the response and return values accordingly
    if (response.statusCode == 200) {
      // We have received news data successfully => get articles list from the response as list
      final newsJsonList = jsonDecode(response.body)['articles'] as List;
      // Iterate over the list and change is news json to News objects
      final newsList = newsJsonList.map((news) => News.fromJson(news)).toList();

      return newsList;
    } else {
      // If something went wrote raise an exception with error text
      throw Exception(jsonDecode(response.body)['body']);
    }
  }
}
