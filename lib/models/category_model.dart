import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  String imageName;
  Color color;
  CategoryModel(
      {required this.id,
      required this.name,
      required this.color,
      required this.imageName});
}
