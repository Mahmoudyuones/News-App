import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/data/repository/news_repoistoy.dart';
import 'package:news/news/view/wigets/news_list.dart';
import 'package:news/news/view_model/news_state.dart';
import 'package:news/shared/server_locator.dart';

class NewsViewModel extends Cubit<NewsState> {
  late final NewsRepoistoy repository;
  List<News> newNewsList = [];

  NewsViewModel() : super(NewsInitial()) {
    repository = NewsRepoistoy(ServerLocator.newsDataSource);
  }
  int page = 1;
  final ScrollController scrollController = ScrollController();
  void onScroll(String newsId) {
    scrollController.addListener(
      () {
        if (scrollController.position.atEdge) {
          bool isTop = scrollController.position.pixels == 0;

          if (!isTop) {
            page++;
            getNews(newsId);
          }
        }
      },
    );
  }

  Future<void> getNews(
    String newsId,
  ) async {
    if (newNewsList.isEmpty) {
      emit(GetNewsLoading());
    }
    try {
      final newsList = await repository.getNews(newsId, page);
      newNewsList.addAll(newsList);
      emit(GetNewsSuccess(newsList: newNewsList));
    } catch (error) {
      emit(GetNewsError(message: error.toString()));
    }
  }
}
