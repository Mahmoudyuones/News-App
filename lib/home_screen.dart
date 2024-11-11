import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categorie/categories.dart';
import 'package:news/drower/home_screen_drower.dart';
import 'package:news/settings/settings_tap.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  drowerItem drawerItemselsectd = drowerItem.categories;
  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App  '),
        ),
        drawer: HomeScreenDrower(onItemSelected: onDrowerItemSelected,),
        body: drawerItemselsectd==drowerItem.categories?Categories():SettingsTap(),
      ),
    );
  }

  onDrowerItemSelected(drowerItem selectedItem) {
    drawerItemselsectd = selectedItem;
    setState(() {});
    Navigator.of(context).pop();
  }
}

enum drowerItem {
  categories,
  settings,
}
