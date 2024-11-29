import 'package:flutter/material.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/view/screens/new_details.dart';
import 'package:news/news/view/wigets/news_item.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/widgets/error_indecator.dart';
import 'package:news/shared/widgets/loading_indecator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  NewsList({required this.sourceId, super.key, required this.searchWord});
  final String sourceId;
  String searchWord = '';

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    List<News> filterdNewsList = widget.searchWord.isEmpty
        ? viewModel.newsList
        : viewModel.newsList
            .where((news) => news.title!
                .toLowerCase()
                .contains(widget.searchWord.toLowerCase()))
            .toList();
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndecator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndecator(viewModel.errorMessage);
          } else {
            return ListView.builder(
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  NewDetails.routeName,
                  arguments: viewModel.newsList[index],
                ),
                child: NewsItem(filterdNewsList[index]),
              ),
              itemCount: filterdNewsList.length,
            );
          }
        },
      ),
    );
  }
}
