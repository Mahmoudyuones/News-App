import 'package:flutter/material.dart';
import 'package:news/shared/server_locator.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/data/repository/sources_repository.dart';

class SourceViewModel with ChangeNotifier {
  late final SourcesRepository repository;

  SourceViewModel() {
    repository = SourcesRepository(ServerLocator.sourcesDataSource);
  }

  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await repository.getSources(categoryId);
    } catch (error) {
      errorMessage = toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
