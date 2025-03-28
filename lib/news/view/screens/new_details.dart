import 'package:flutter/material.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/view/wigets/news_item.dart';
import 'package:news/shared/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewDetails extends StatelessWidget {
  static const routeName = '/news details';

  const NewDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
                news.source?.name ?? AppLocalizations.of(context)!.newDetails),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                NewsItem(news),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(25)),
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          news.description ?? '',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppTheme.whiteDark,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          style: TextButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              splashFactory: InkRipple.splashFactory,
                              elevation: 5),
                          onPressed: () {
                            final uri = Uri.parse(news.url!);
                            launchUrl(uri);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.play_arrow,
                                color: AppTheme.black,
                              ),
                              Text(
                                AppLocalizations.of(context)!.viewFullArticle,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppTheme.black),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
