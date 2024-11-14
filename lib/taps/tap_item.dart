import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class TapItem extends StatelessWidget {
  TapItem({super.key, required this.sourceName, required this.isSelected});
  String sourceName;
  bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.transparent,
          border: Border.all(color: AppTheme.primary, width: 2),
          borderRadius: BorderRadius.circular(25)),
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Text(
        sourceName,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: isSelected ? AppTheme.white : AppTheme.primary),
      ),
    );
  }
}
