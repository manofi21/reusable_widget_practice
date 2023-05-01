import 'dart:typed_data';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

class MyStaggeredGridview extends StatefulWidget {
  final List<Uint8List> listUint8List;
  const MyStaggeredGridview({Key? key, required this.listUint8List})
      : super(key: key);

  @override
  State<MyStaggeredGridview> createState() => _MyStaggeredGridviewState();
}

class _MyStaggeredGridviewState extends State<MyStaggeredGridview> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: widget.listUint8List.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      itemBuilder: (context, index) {
        return Tile(
          index: index,
          // extent: (index % 5 + 1) * 100,
          backgroundColor: Colors.blue,
          imageAsUint8List: widget.listUint8List[index],
        );
      },
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    // this.extent,
    this.backgroundColor,
    this.bottomSpace,
    required this.imageAsUint8List,
  }) : super(key: key);

  final int index;
  final Uint8List imageAsUint8List;
  // final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final image = Image.memory(
        imageAsUint8List,
        fit: BoxFit.cover,
      );
    final widget = Container(
      color: backgroundColor,
      height: image.height,
      child: image,
    );

    if (bottomSpace == null) {
      return widget;
    }

    return Column(
      children: [
        Expanded(child: widget),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}
