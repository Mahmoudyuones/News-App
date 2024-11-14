import 'package:flutter/material.dart';
import 'package:news/models/sources.dart';
import 'package:news/taps/tap_item.dart';

class SourceTap extends StatefulWidget {
  SourceTap({super.key, required this.sources});
  List<Sources> sources;

  @override
  State<SourceTap> createState() => _SourceTapState();
}

class _SourceTapState extends State<SourceTap> {
  int selectdIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    sourceName: source.name,
                    isSelected: selectdIndex == widget.sources.indexOf(source),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
