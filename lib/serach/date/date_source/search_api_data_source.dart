import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/data/models/news_response.dart';
import 'package:news/serach/date/date_source/search_date_source.dart';
import 'package:news/shared/api_constant.dart';
import 'package:http/http.dart' as http;

class SearchApiDataSource extends SearchDateSource {
  @override
  Future<List<News>> getSearchedNews(String keyword) async {
    final uri = Uri.https(APIConstant.baseUrl, APIConstant.newsEndpoint, {
      'apiKey': APIConstant.apiKey,
      'q': keyword,
    });
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final searchedNewsResponse = NewsResponse.fromJson(json);
    if (searchedNewsResponse.status == 'ok' &&
        searchedNewsResponse.news != null) {
      return searchedNewsResponse.news!;
    } else {
      throw Exception("Failed to get News");
    }
  }
}
