import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/server_locator.dart';
import 'package:news/sources/data/repository/sources_repository.dart';
import 'package:news/sources/view_model/sources_state.dart';

class SourceViewModel extends Cubit<SourcesState> {
  late final SourcesRepository repository;

  SourceViewModel() : super(SourciseInitial()) {
    repository = SourcesRepository(ServerLocator.sourcesDataSource);
  }

  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoading());
    try {
      final sources = await repository.getSources(categoryId);
      emit(GetSourcesSuccess(sources: sources));
    } catch (error) {
      emit(GetSourcesEroor(message: error.toString()));
    }
  }
}
