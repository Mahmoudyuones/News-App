import 'package:flutter/material.dart';
import 'package:news/models/sources_response/source.dart';
import 'package:news/news/news_list.dart';
import 'package:news/taps/tap_item.dart';

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
                selectdIndex = index;
                setState(() {});
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
            child: NewsList(widget.sources[selectdIndex].id!),
          ),
        ],
      ),
    );
  }
}
