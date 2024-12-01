import 'package:news/news/data/models/news.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class GetNewsLoading extends NewsState {}

class GetNewsError extends NewsState {
  final String message;

  GetNewsError({required this.message});
}

class GetNewsSuccess extends NewsState {
  final List<News> newsList;

  GetNewsSuccess({required this.newsList});
}
