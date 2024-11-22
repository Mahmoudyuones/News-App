import 'package:flutter/material.dart';
import 'package:news/API/api_service.dart';
import 'package:news/taps/source_tap.dart';
import 'package:news/widgets/error_indecator.dart';
import 'package:news/widgets/loading_indecator.dart';

class CategoryDetails extends StatelessWidget {
  final String categoryId;
  const CategoryDetails({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSource(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndecator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndecator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourceTap(sources: sources); 
        }
      },
    );
  }
}
