import 'package:flutter/material.dart';
import 'package:news/categorie/view/widgets/categry_item.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/categorie/data/models/category_model.dart';

class Categories extends StatelessWidget {
  final void Function(CategoryModel) onCategorySelectd;
  Categories({super.key, required this.onCategorySelectd});
  final List<CategoryModel> categories = [
    CategoryModel(
        id: 'sports', name: 'Sports', color: AppTheme.red, imageName: 'ball'),
         CategoryModel(
        id: 'business', name: 'Business', color: AppTheme.broown, imageName: 'bussines'),
         CategoryModel(
        id: 'entertainment', name: 'Entertainment', color: AppTheme.babyblue, imageName: 'Politics'),
         CategoryModel(
        id: 'general', name: 'General', color: AppTheme.blue, imageName: 'environment'),
         CategoryModel(
        id: 'health', name: 'Health', color: AppTheme.move, imageName: 'health'),
         CategoryModel(
        id: 'science', name: 'Science', color: AppTheme.yellew, imageName: 'science'),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'Pick your category of interset',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: AppTheme.nevy),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 24, mainAxisSpacing: 24),
              itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    onCategorySelectd(categories[index]);
                  },
                  child: CategryItem(
                    index: index,
                    category: categories[index],
                  )),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
