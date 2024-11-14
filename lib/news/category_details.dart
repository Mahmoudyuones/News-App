import 'package:flutter/material.dart';
import 'package:news/models/sources.dart';
import 'package:news/taps/source_tap.dart';

class CategoryDetails extends StatelessWidget {
  String id;
  CategoryDetails({super.key, required this.id});
  List<Sources> sources = List.generate(
    20,
    (index) => Sources(id: '$index', name: '${index} source'),
  );
  @override
  Widget build(BuildContext context) {
    return SourceTap(sources: sources);
  }
}
