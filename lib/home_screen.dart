import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/categorie/categories.dart';
import 'package:news/drower/home_screen_drower.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
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
        drawer: HomeScreenDrower(),
        body: Categories(),
      ),
    );
  }
}
