import 'package:flutter/material.dart';
import 'package:news/categorie/view/widgets/categry_item.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/categorie/data/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Categories extends StatelessWidget {
  final void Function(CategoryModel) onCategorySelectd;

  const Categories({super.key, required this.onCategorySelectd});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final List<CategoryModel> categories = [
      CategoryModel(
          id: 'sports',
          name: appLocalizations.sports,
          color: AppTheme.red,
          imageName: 'ball'),
      CategoryModel(
          id: 'business',
          name: appLocalizations.business,
          color: AppTheme.broown,
          imageName: 'bussines'),
      CategoryModel(
          id: 'entertainment',
          name: appLocalizations.entertainment,
          color: AppTheme.babyblue,
          imageName: 'Politics'),
      CategoryModel(
          id: 'general',
          name: appLocalizations.general,
          color: AppTheme.blue,
          imageName: 'environment'),
      CategoryModel(
          id: 'health',
          name: appLocalizations.health,
          color: AppTheme.move,
          imageName: 'health'),
      CategoryModel(
          id: 'science',
          name: appLocalizations.science,
          color: AppTheme.yellew,
          imageName: 'science'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              appLocalizations.pickYourCategoryOfInterest,
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
              itemCount: categories.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  onCategorySelectd(categories[index]);
                },
                child: CategryItem(
                  index: index,
                  category: categories[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
