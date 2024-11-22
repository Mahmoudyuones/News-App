import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/API/api_constant.dart';
import 'package:news/models/news_response/newsResponse.dart';
import 'package:news/models/sources_response/sources_response.dart';

class ApiService {
  static Future<SourcesResponse> getSource(String categoryId) async {
    final uri = Uri.https(
      APIConstant.baseUrl,
      APIConstant.sourceEndpoint,
      {
        'apiKey': APIConstant.apiKey,
        'category': categoryId,
      },
    );
    final respons = await http.get(uri);
    final json = jsonDecode(respons.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(newsId) async {
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
