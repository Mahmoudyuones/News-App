import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view/wigets/news_list.dart';
import 'package:news/news/view_model/news_state.dart';
import 'package:news/serach/date/reposatory/searched_news_repo.dart';
import 'package:news/serach/view_model/searched_news_state.dart';
import 'package:news/shared/server_locator.dart';

class SearchedNewsViewModel extends Cubit<SearchedNewsState> {
  late final SearchedNewsRepo reposatory;
  SearchedNewsViewModel() : super(SearchedNewsInitial()) {
    reposatory = SearchedNewsRepo(dataSource: ServerLocator.searchDataSource);
  }
  Future<void> getSearchedNews(String keyword) async {
    emit(GetSearchedNewsLoading());
    try {
      final newsList = await reposatory.getNews(keyword);
      emit(GetSearchedNewsSuccess(newsList: newsList));
    } catch (error) {
      emit(GetSearchedNewsError(message: "Failed to get news"));
    }
  }
}
