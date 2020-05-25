import 'package:client/widget/progress_item.dart';
import 'package:flutter/material.dart';

class ProgressLlist extends StatelessWidget {
  const ProgressLlist({Key key, @required this.arr}) : super(key: key);

  final arr;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: arr.length,
      itemBuilder: (context, index) {

        final progress = arr[index];

        return ProgressItem(arr: progress,);
      }, 
    );
  }
}