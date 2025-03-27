import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsRepoistoy {
  final NewsDataSource dataSource;

  const NewsRepoistoy(this.dataSource);

  Future<List<News>> getNews(String sourceId, int? page) async {
    return dataSource.getNews(sourceId, page);
  }
}
