import 'package:flutter/material.dart';
import 'package:news/sources/data/data_source/source_data_source.dart';
import 'package:news/sources/data/models/source.dart';

class SourecViewModel with ChangeNotifier {
  final dataSource = SourceDataSource();

  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSources(String CategoryId) async {
    isLoading = true;
    notifyListeners();
    try {
      final respons = await dataSource.getSource(CategoryId);
      if (respons.status == 'ok' && respons.status != null) {
        sources = respons.sources!;
      } else {
        errorMessage = 'Failed to get sources';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
