import 'dart:convert';

import 'package:news/shared/api_constant.dart';
import 'package:news/sources/data/data_source/sources_data_source.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/sources/data/models/sources_response.dart';
import 'package:http/http.dart' as http;

class SourceApiDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSource(String categoryId) async {
    final uri = Uri.https(
      APIConstant.baseUrl,
      APIConstant.sourceEndpoint,
      {
        'apiKey': APIConstant.apiKey,
        'category': categoryId,
      },
    );
    final respons = await http.get(uri);
    final json = jsonDecode(respons.body);
    final sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Failed to get sources');
    }
  }
}
