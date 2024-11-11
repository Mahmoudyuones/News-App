import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeScreenDrower extends StatelessWidget {
  const HomeScreenDrower({super.key});

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
                'New App!',
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
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(Icons.menu),
                          Text(
                            'Categories',
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
                      onTap: () { },
                      child: Row(
                        children: [
                          const Icon(Icons.settings),
                          Text(
                            'Settings',
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
