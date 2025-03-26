import 'package:news/news/data/models/news.dart';

abstract class SearchedNewsState {}

class SearchedNewsInitial extends SearchedNewsState {}

class GetSearchedNewsLoading extends SearchedNewsState {}

class GetSearchedNewsError extends SearchedNewsState {
  final String message;

  GetSearchedNewsError({required this.message});
}

class GetSearchedNewsSuccess extends SearchedNewsState {
  final List<News> newsList;

  GetSearchedNewsSuccess({required this.newsList});
}
