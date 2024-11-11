import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category_model.dart';

class CategryItem extends StatelessWidget {
  int index;
  CategryItem({required this.index,required this.category});
  CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: index.isOdd ? Radius.circular(24) : Radius.circular(0),
            bottomStart:
                index.isEven ? Radius.circular(24) : Radius.circular(0),
            topEnd: Radius.circular(24),
            topStart: Radius.circular(24),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/${category.imageName}.png'),
          Text(
            '${category.name}',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
