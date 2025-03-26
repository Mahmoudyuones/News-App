import 'package:news/news/data/data_source/news_api_data_source.dart';
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/serach/date/date_source/search_api_data_source.dart';
import 'package:news/serach/date/date_source/search_date_source.dart';
import 'package:news/sources/data/data_source/source_api_data_source.dart';
import 'package:news/sources/data/data_source/sources_data_source.dart';

class ServerLocator {
  static final SourcesDataSource sourcesDataSource = SourceApiDataSource();
  static final NewsDataSource newsDataSource = NewsApiDataSource();
  static final SearchDateSource searchDataSource = SearchApiDataSource();
}
