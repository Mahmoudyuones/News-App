import 'package:flutter/material.dart';
import 'package:news/categorie/view/widgets/categories.dart';
import 'package:news/categorie/view/widgets/category_details.dart';
import 'package:news/serach/view/screens/custom_search_deleget.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/home/view/widgets/home_screen_drower.dart';
import 'package:news/categorie/data/models/category_model.dart';
import 'package:news/settings/view/wodgets/settings_tap.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(selectdCategory != null
              ? selectdCategory!.name
              : drawerItemselsectd == DrowerItem.settings
                  ? AppLocalizations.of(context)!.settings
                  : AppLocalizations.of(context)!.newsApp),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: CustomSearchDeleget());
                  },
                  icon: const Icon(Icons.search)),
            )
          ],
        ),
        drawer: HomeScreenDrower(
          onItemSelected: onDrowerItemSelected,
        ),
        body: selectdCategory != null
            ? CategoryDetails(
                categoryId: selectdCategory!.id,
              )
            : drawerItemselsectd == DrowerItem.categories
                ? Categories(
                    onCategorySelectd: onCategorySelectd,
                  )
                : const SettingsTap(),
      ),
    );
  }

  DrowerItem drawerItemselsectd = DrowerItem.categories;
  CategoryModel? selectdCategory;

  onDrowerItemSelected(DrowerItem selectedItem) {
    selectdCategory = null;
    drawerItemselsectd = selectedItem;
    setState(() {});
    Navigator.of(context).pop();
  }

  onCategorySelectd(CategoryModel category) {
    selectdCategory = category;
    setState(() {});
  }
}

enum DrowerItem {
  categories,
  settings,
}
