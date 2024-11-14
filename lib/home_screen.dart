import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categorie/categories.dart';
import 'package:news/drower/home_screen_drower.dart';
import 'package:news/models/category_model.dart';
import 'package:news/news/category_details.dart';
import 'package:news/settings/settings_tap.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

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
              : drawerItemselsectd == drowerItem.settings
                  ? 'Settings'
                  : 'News App'),
        ),
        drawer: HomeScreenDrower(
          onItemSelected: onDrowerItemSelected,
        ),
        body: selectdCategory != null
            ? CategoryDetails(
                id: selectdCategory!.id,
              )
            : drawerItemselsectd == drowerItem.categories
                ? Categories(
                    onCategorySelectd: onCategorySelectd,
                  )
                : const SettingsTap(),
      ),
    );
  }

  drowerItem drawerItemselsectd = drowerItem.categories;
  CategoryModel? selectdCategory;

  onDrowerItemSelected(drowerItem selectedItem) {
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

enum drowerItem {
  categories,
  settings,
}
