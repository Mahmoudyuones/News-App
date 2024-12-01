import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/sources/view/widgets/source_tap.dart';
import 'package:news/shared/widgets/error_indecator.dart';
import 'package:news/shared/widgets/loading_indecator.dart';
import 'package:news/sources/view_model/source_view_model.dart';
import 'package:news/sources/view_model/sources_state.dart';

class CategoryDetails extends StatefulWidget {
  final String categoryId;
  const CategoryDetails({super.key, required this.categoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourceViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<SourceViewModel, SourcesState>(
        builder: (_, state) {
          if (state is GetSourcesLoading) {
            return const LoadingIndecator();
          } else if (state is GetSourcesEroor) {
            return ErrorIndecator(state.message);
          } else if (state is GetSourcesSuccess) {
            return SourceTap(sources: state.sources);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
