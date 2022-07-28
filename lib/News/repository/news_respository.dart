import 'package:news_app/News/data_provider/news_provider.dart';
import 'package:news_app/News/model/news.dart';

class NewsRepository {
  final NewsProvider provider;

  NewsRepository({required this.provider});

  Future<List<News>> getNewsList() async {
    // Make a call to the getNewsList method from the data provider and return the result
    return await provider.getNewsList();
  }
}
