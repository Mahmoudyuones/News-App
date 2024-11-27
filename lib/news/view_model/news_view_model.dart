import 'package:flutter/material.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/data/repository/news_repoistoy.dart';
import 'package:news/shared/server_locator.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepoistoy repository;

  NewsViewModel() {
    repository = NewsRepoistoy(ServerLocator.newsDataSource);
  }

  List<News> newsList = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getNews(String newsId) async {
    isLoading = true;
    notifyListeners();
    try {
      newsList = await repository.getNews(newsId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
