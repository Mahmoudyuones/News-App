import 'package:flutter/material.dart';
import 'package:news/categorie/data/models/category_model.dart';

class CategryItem extends StatelessWidget {
  final int index;
  const CategryItem({super.key, required this.index, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: index.isOdd
                ? const Radius.circular(24)
                : const Radius.circular(0),
            bottomStart: index.isEven
                ? const Radius.circular(24)
                : const Radius.circular(0),
            topEnd: const Radius.circular(24),
            topStart: const Radius.circular(24),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/${category.imageName}.png',
            fit: BoxFit.fill,
            height: 100,
          ),
          Text(
            category.name,
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
