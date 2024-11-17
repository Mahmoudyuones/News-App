import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/widgets/loading_indecator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 30));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl:
                  'https://imgs.search.brave.com/NEROQs0Yl8AsrHgXt1hgYyeKrzVaO2taXdTykqRIG5s/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9lMC4z/NjVkbS5jb20vMjQv/MTAvMzg0eDIxNi9z/a3lzcG9ydHMtbWJh/cHBlLXJlYWwtbWFk/cmlkXzY3MzIzMjEu/anBnPzIwMjQxMDI5/MTgxOTAw',
              fit: BoxFit.fill,
              placeholder: (_, __) => const LoadingIndecator(),
              errorWidget: (_, __, ___) =>
                  const Icon(Icons.image_not_supported_outlined),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text('BBC news',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 10, color: AppTheme.grey)),
          Text(
            "Why are football's biggest clubs starting a new tournament?",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(fifteenAgo),
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
