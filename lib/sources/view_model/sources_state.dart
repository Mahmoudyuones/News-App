import 'package:news/sources/data/models/source.dart';

abstract class SourcesState {}

class SourciseInitial extends SourcesState {}

class GetSourcesLoading extends SourcesState {}

class GetSourcesEroor extends SourcesState {
  final String message;
  GetSourcesEroor({required this.message});
}

class GetSourcesSuccess extends SourcesState {
  final List<Source> sources;
  GetSourcesSuccess({required this.sources});
}
