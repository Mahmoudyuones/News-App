import 'dart:convert';

import 'package:news/shared/api_constant.dart';
import 'package:news/sources/data/models/sources_response.dart';
import 'package:http/http.dart' as http;

class SourceDataSource {
  Future<SourcesResponse> getSource(String categoryId) async {
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
    return SourcesResponse.fromJson(json);
  }
} 