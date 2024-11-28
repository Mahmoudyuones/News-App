import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';

class searchBarNews extends StatefulWidget {
  final void Function() onClearPressed;
  final void Function(String enterdText) onSearchPressed;
  const searchBarNews(
      {super.key, required this.onClearPressed, required this.onSearchPressed});

  @override
  State<searchBarNews> createState() => _searchBarNewsState();
}

class _searchBarNewsState extends State<searchBarNews> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(width: 0, color: Colors.transparent),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        prefixIcon: IconButton(
          onPressed: () {
            widget.onClearPressed();
            _searchController.clear();
            widget.onSearchPressed(_searchController.text);
          },
          icon: const Icon(
            Icons.clear,
            color: AppTheme.primary,
          ),
        ),
        suffixIcon: IconButton(
            onPressed: () {
              widget.onSearchPressed(_searchController.text);
            },
            icon: const Icon(
              Icons.search,
              color: AppTheme.primary,
            )),
        hintText: 'Search',
        hintStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: AppTheme.primary.withOpacity(.5)),
        filled: true,
        fillColor: AppTheme.white,
      ),
    );
  }
}
