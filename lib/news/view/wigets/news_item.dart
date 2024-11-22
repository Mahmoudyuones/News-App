import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/shared/widgets/loading_indecator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.news, {super.key});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ??
                  'https://t3.ftcdn.net/jpg/04/75/01/08/240_F_475010836_qg1pCkS5yT7lXMYSMogKvtu41iKFWTRC.jpg',
              fit: BoxFit.fill,
              placeholder: (_, __) => const LoadingIndecator(),
              errorWidget: (_, __, ___) =>
                  const Icon(Icons.image_not_supported_outlined),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(news.source?.name ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 10, color: AppTheme.grey)),
          Text(
            news.title ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(DateTime.parse(news.publishedAt!)),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppTheme.grey,
                    fontSize: 13,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
