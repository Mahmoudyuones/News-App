import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';

class TapItem extends StatelessWidget {
  const TapItem({super.key, required this.sourceName, required this.isSelected});
  final String sourceName;
 final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.transparent,
          border: Border.all(color: AppTheme.primary, width: 2),
          borderRadius: BorderRadius.circular(25)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
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
