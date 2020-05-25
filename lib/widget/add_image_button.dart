import 'package:client/widget/bloc/image_bloc.dart';
import 'package:flutter/material.dart';

class AddImageButton extends StatefulWidget {
  AddImageButton({Key key, @required this.id}) : super(key: key);

  // work id
  final id;

  @override
  _AddImageButtonState createState() => _AddImageButtonState();
}

class _AddImageButtonState extends State<AddImageButton> {

  ImageBloc imageBloc = ImageBloc();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        imageBloc.add(NewImage(id: widget.id));
      },
      child: Text("add imagey button."),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    imageBloc.close();
  }
}