import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/home/view/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreenDrower extends StatelessWidget {
  final Function(DrowerItem) onItemSelected;
  const HomeScreenDrower({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: screenSize.width * .7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            color: AppTheme.primary,
            height: screenSize.height * .2,
            child: Text(
              AppLocalizations.of(context)!.newsApp,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 24),
            ),
          ),
          Expanded(
              child: Container(
            color: AppTheme.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      onItemSelected(DrowerItem.categories);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.menu),
                        Text(
                          '  ${AppLocalizations.of(context)!.categories}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      onItemSelected(DrowerItem.settings);
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        Text(
                          '  ${AppLocalizations.of(context)!.settings}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
