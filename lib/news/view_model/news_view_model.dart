import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/data/repository/news_repoistoy.dart';
import 'package:news/news/view_model/news_state.dart';
import 'package:news/shared/server_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
  late final NewsRepoistoy repository;

  NewsViewModel() : super(NewsInitial()) {
    repository = NewsRepoistoy(ServerLocator.newsDataSource);
  }
  Future<void> getNews(String newsId) async {
    emit(GetNewsLoading());
    try {
      final newsList = await repository.getNews(newsId);
      emit(GetNewsSuccess(newsList: newsList));
    } catch (error) {
      emit(GetNewsError(message: error.toString()));
    }
  }
}
