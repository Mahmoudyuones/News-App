import 'package:news/categorie/data/models/category_model.dart';
import 'package:news/shared/app_theme.dart';

class CategorieViewModel {
  final List<CategoryModel> categories = [
    CategoryModel(
        id: 'sports', name: 'Sports', color: AppTheme.red, imageName: 'ball'),
    CategoryModel(
        id: 'business',
        name: 'Business',
        color: AppTheme.broown,
        imageName: 'bussines'),
    CategoryModel(
        id: 'entertainment',
        name: 'Entertainment',
        color: AppTheme.babyblue,
        imageName: 'Politics'),
    CategoryModel(
        id: 'general',
        name: 'General',
        color: AppTheme.blue,
        imageName: 'environment'),
    CategoryModel(
        id: 'health',
        name: 'Health',
        color: AppTheme.move,
        imageName: 'health'),
    CategoryModel(
        id: 'science',
        name: 'Science',
        color: AppTheme.yellew,
        imageName: 'science'),
  ];
  List<CategoryModel> filterdCategories = [
    CategoryModel(
        id: 'sports', name: 'Sports', color: AppTheme.red, imageName: 'ball'),
    CategoryModel(
        id: 'business',
        name: 'Business',
        color: AppTheme.broown,
        imageName: 'bussines'),
    CategoryModel(
        id: 'entertainment',
        name: 'Entertainment',
        color: AppTheme.babyblue,
        imageName: 'Politics'),
    CategoryModel(
        id: 'general',
        name: 'General',
        color: AppTheme.blue,
        imageName: 'environment'),
    CategoryModel(
        id: 'health',
        name: 'Health',
        color: AppTheme.move,
        imageName: 'health'),
    CategoryModel(
        id: 'science',
        name: 'Science',
        color: AppTheme.yellew,
        imageName: 'science'),
  ];
  onSearchPressed(String enterdText) {
    if (enterdText.isEmpty) {
      filterdCategories = categories;
    } else {
      filterdCategories = categories
          .where((categorie) =>
              categorie.name.toLowerCase().contains(enterdText.toLowerCase()))
          .toList();
    }
  }
}
