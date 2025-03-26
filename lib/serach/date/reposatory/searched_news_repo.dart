import 'package:news/news/data/models/news.dart';
import 'package:news/serach/date/date_source/search_api_data_source.dart';
import 'package:news/serach/date/date_source/search_date_source.dart';

class SearchedNewsRepo {
  final SearchDateSource dataSource;

  SearchedNewsRepo({required this.dataSource});

  Future<List<News>> getNews(String keyword) async {
    return dataSource.getSearchedNews(keyword);
  }
}
