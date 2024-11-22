import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/shared/api_constant.dart';
import 'package:news/news/data/models/newsResponse.dart';
class NewsDataSource {
  Future<NewsResponse> getNews(newsId) async {
    final uri = Uri.https(
      APIConstant.baseUrl,
      APIConstant.newsEndpoint,
      {
        'apiKey': APIConstant.apiKey,
        'sources': newsId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
