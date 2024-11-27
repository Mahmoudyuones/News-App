import 'package:news/sources/data/models/source.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSource(String categoryId);
}
