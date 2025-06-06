import 'package:flutter/material.dart';
import 'package:news/sources/data/models/source.dart';
import 'package:news/news/view/wigets/news_list.dart';
import 'package:news/sources/view/widgets/tap_item.dart';

class SourceTap extends StatefulWidget {
  const SourceTap({super.key, required this.sources});
  final List<Source> sources;

  @override
  State<SourceTap> createState() => _SourceTapState();
}

class _SourceTapState extends State<SourceTap> {
  int selectdIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                setState(() {
                  selectdIndex = index;
                });
              },
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map(
                    (source) => TapItem(
                      sourceName: source.name ?? '',
                      isSelected:
                          selectdIndex == widget.sources.indexOf(source),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: NewsList(
              widget.sources[selectdIndex].id!,
              key: ValueKey(widget.sources[selectdIndex].id!),
            ),
          ),
        ],
      ),
    );
  }
}
