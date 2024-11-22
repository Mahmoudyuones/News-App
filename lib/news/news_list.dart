import 'package:flutter/material.dart';
import 'package:news/API/api_service.dart';
import 'package:news/news/news_item.dart';
import 'package:news/widgets/error_indecator.dart';
import 'package:news/widgets/loading_indecator.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.sourceId,{super.key});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiService.getNews(sourceId), builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting) {
        return const LoadingIndecator();
      } else if(snapshot.hasError || snapshot.data?.status != 'ok')
      {
      return const ErrorIndecator();
      }
      else 
      {
        final newsList=snapshot.data?.news??[];
        return ListView.builder(
        itemBuilder: (_, index) =>  NewsItem(newsList[index]),
        itemCount: newsList.length,
              );
      }

    });
  }
}
