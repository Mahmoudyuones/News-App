import 'package:flutter/material.dart';
import 'package:news/categorie/view/widgets/categories.dart';
import 'package:news/categorie/view/widgets/category_details.dart';
import 'package:news/categorie/view_model/categorie_view_model.dart';
import 'package:news/home/view/widgets/search_bar.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/home/view/widgets/home_screen_drower.dart';
import 'package:news/categorie/data/models/category_model.dart';
import 'package:news/settings/view/wodgets/settings_tap.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSeraching = false;
  String searchText = '';
  final categorieViewModel = CategorieViewModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        appBar: isSeraching
            ? AppBar(
                title: searchBarNews(
                  onClearPressed: onClearPressed,
                  onSearchPressed: onSearchPressed,
                ),
              )
            : AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        isSeraching = true;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                        size: 35,
                      ))
                ],
                title: Text(selectdCategory != null
                    ? selectdCategory!.name
                    : drawerItemselsectd == DrowerItem.settings
                        ? 'Settings'
                        : 'News App'),
              ),
        drawer: isSeraching
            ? null
            : HomeScreenDrower(
                onItemSelected: onDrowerItemSelected,
              ),
        body: selectdCategory != null
            ? CategoryDetails(
                categoryId: selectdCategory!.id,
                searchWord: searchText,
              )
            : drawerItemselsectd == DrowerItem.categories
                ? Categories(
                    categories: categorieViewModel.filterdCategories,
                    onCategorySelectd: onCategorySelectd,
                    searchWord: searchText,
                  )
                : const SettingsTap(),
      ),
    );
  }

  DrowerItem drawerItemselsectd = DrowerItem.categories;
  CategoryModel? selectdCategory;

  onDrowerItemSelected(DrowerItem selectedItem) {
    selectdCategory = null;
    isSeraching = false;
    drawerItemselsectd = selectedItem;

    setState(() {});
    Navigator.of(context).pop();
  }

  onCategorySelectd(CategoryModel category) {
    selectdCategory = category;
    isSeraching = false;
    searchText = '';
    setState(() {});
  }

  onClearPressed() {
    isSeraching = false;
    setState(() {});
  }

  onSearchPressed(String enterdText) {
    categorieViewModel.onSearchPressed(enterdText);
    setState(() {});
  }
}

enum DrowerItem {
  categories,
  settings,
}
