import 'package:flutter/material.dart';
import 'package:news/sources/view/widgets/source_tap.dart';
import 'package:news/shared/widgets/error_indecator.dart';
import 'package:news/shared/widgets/loading_indecator.dart';
import 'package:news/sources/view_model/source_view_model.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SourceViewModel>(
        builder: (_, veiwModel, __) {
          if (veiwModel.isLoading) {
            return const LoadingIndecator();
          } else if (veiwModel.errorMessage != null) {
            return ErrorIndecator(veiwModel.errorMessage);
          } else {
            return SourceTap(sources: veiwModel.sources);
          }
        },
      ),
    );
  }
}
