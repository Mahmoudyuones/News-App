import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categorie/categry_item.dart';
import 'package:news/models/category_model.dart';

class Categories extends StatelessWidget {
  void Function(CategoryModel) onCategorySelectd;
  Categories({required this.onCategorySelectd});
  List<CategoryModel> categories = List.generate(
      6,
      (index) => CategoryModel(
          id: '$index',
          name: 'Sports',
          color: AppTheme.red,
          imageName: 'ball'));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
