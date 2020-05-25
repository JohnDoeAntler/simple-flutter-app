import 'package:client/widget/work_item.dart';
import 'package:flutter/material.dart';

class WorkList extends StatefulWidget {
  WorkList({Key key, @required this.arr, bool this.shrinkWrap}) : super(key: key);

  final arr;

  final shrinkWrap;

  @override
  _WorkListState createState() => _WorkListState();
}

class _WorkListState extends State<WorkList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: widget.shrinkWrap ?? false,
      itemCount: widget.arr.length,
      itemBuilder: (context, index) {
        return WorkItem(item: widget.arr[index]);
      },
    );
  }
}