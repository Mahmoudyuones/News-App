import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/view/screens/new_details.dart';
import 'package:news/news/view/wigets/news_item.dart';
import 'package:news/news/view_model/news_state.dart';
import 'package:news/news/view_model/news_view_model.dart';
import 'package:news/shared/widgets/error_indecator.dart';
import 'package:news/shared/widgets/loading_indecator.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.sourceId, {super.key});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();
  @override
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsState>(
        builder: (_, state) {
          if (state is GetNewsLoading) {
            return const LoadingIndecator();
          } else if (state is GetNewsError) {
            return ErrorIndecator(state.message);
          } else if (state is GetNewsSuccess) {
            return ListView.builder(
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  NewDetails.routeName,
                  arguments: state.newsList[index],
                ),
                child: NewsItem(
                  state.newsList[index],
                ),
              ),
              itemCount: state.newsList.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
