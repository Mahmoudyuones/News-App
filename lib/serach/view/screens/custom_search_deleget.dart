import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/data/models/news.dart';
import 'package:news/news/view/screens/new_details.dart';
import 'package:news/news/view/wigets/news_item.dart';
import 'package:news/news/view/wigets/news_list.dart';
import 'package:news/serach/view/widgets/searched_news_item.dart';
import 'package:news/serach/view_model/searched_news_state.dart';
import 'package:news/serach/view_model/searched_news_view_model.dart';
import 'package:news/shared/app_theme.dart';
import 'package:news/shared/widgets/error_indecator.dart';
import 'package:news/shared/widgets/loading_indecator.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomSearchDeleget extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsetsDirectional.only(end: 20),
        child: IconButton(
            onPressed: () => showResults(context),
            icon: const Icon(Icons.search)),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text("Please Enter KeyWords"),
      );
    }
    final viewModel = SearchedNewsViewModel();
    viewModel.getSearchedNews(query);
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<SearchedNewsViewModel, SearchedNewsState>(
        builder: (context, state) {
          if (state is GetSearchedNewsLoading) {
            return const LoadingIndecator();
          } else if (state is GetSearchedNewsError) {
            return ErrorIndecator(
                AppLocalizations.of(context)!.failedToGetNews);
          } else if (state is GetSearchedNewsSuccess) {
            return ListView.builder(
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    NewDetails.routeName,
                    arguments: state.newsList[index]),
                child: SearchedNewsItem(
                  news: state.newsList[index],
                ),
              ),
              itemCount: state.newsList.length,
            );
          }
          return Container();
        },
      ),
    );
  }

  String? lastquery;
  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text("Please Enter KeyWords"),
      );
    }
    final viewModel = SearchedNewsViewModel();

    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<SearchedNewsViewModel, SearchedNewsState>(
        builder: (context, state) {
          if (lastquery != query) {
            lastquery = query;
            BlocProvider.of<SearchedNewsViewModel>(context)
                .getSearchedNews(query);
          }
          if (state is GetSearchedNewsLoading) {
            return const LoadingIndecator();
          } else if (state is GetSearchedNewsError) {
            return ErrorIndecator(state.message);
          } else if (state is GetSearchedNewsSuccess) {
            return ListView.builder(
              itemBuilder: (_, index) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    NewDetails.routeName,
                    arguments: state.newsList[index]),
                child: SearchedNewsItem(
                  news: state.newsList[index],
                ),
              ),
              itemCount: state.newsList.length,
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppTheme.primary,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppTheme.white,
        ),
        iconTheme: IconThemeData(color: AppTheme.white, size: 27),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: UnderlineInputBorder(borderSide: BorderSide.none),
      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 18, color: AppTheme.white)),
    );
  }
}
