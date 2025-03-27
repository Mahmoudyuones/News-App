import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/shared/api_constant.dart';
import 'package:news/news/data/models/news_response.dart';

class NewsApiDataSource extends NewsDataSource {
  @override
  Future<List<News>> getNews(String newsId, int? page) async {
    final uri = Uri.https(
      APIConstant.baseUrl,
      APIConstant.newsEndpoint,
      {
        'apiKey': APIConstant.apiKey,
        'sources': newsId,
        'pageSize': '3',
        'page': '$page'
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.news != null) {
      return newsResponse.news!;
    } else {
      throw Exception('Failed to get news');
    }
  }
}
