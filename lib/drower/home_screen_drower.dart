import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/home_screen.dart';

class HomeScreenDrower extends StatelessWidget {
  void Function(drowerItem) onItemSelected;
  HomeScreenDrower({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: screenSize.width * .7,
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              color: AppTheme.primary,
              height: screenSize.height * .2,
              child: Text(
                'News App!',
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
                        onItemSelected(drowerItem.categories);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.menu),
                          Text(
                            '  Categories',
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
                        onItemSelected(drowerItem.settings);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.settings),
                          Text(
                            '  Settings',
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
      ),
    );
  }
}
