import 'package:news/news/data/models/news.dart';

abstract class SearchDateSource {
  Future<List<News>> getSearchedNews(String keyword);
}
