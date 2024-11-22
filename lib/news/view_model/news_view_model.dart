import 'package:flutter/material.dart';
import 'package:news/news/data/data_source/news_data_source.dart';
import 'package:news/news/data/models/news.dart';

class NewsViewModel with ChangeNotifier {
  
  final dataSource  = NewsDataSource();
  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> getNews(String newsId) async {
    isLoading = true;
    notifyListeners();
    try {
      final respons = await dataSource.getNews(newsId);
      if (respons.status == 'ok' && respons.status != null) {
        newsList = respons.news!;
      } else {
        errorMessage = "Failed To Get The News";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
