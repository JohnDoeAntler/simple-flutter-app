import 'package:client/widget/bloc/video_bloc.dart';
import 'package:flutter/material.dart';

class SynthesizeButton extends StatefulWidget {
  SynthesizeButton({
    Key key,
    @required this.userId,
    @required this.workId,
  }) : super(key: key);

  final userId;
  final workId;

  @override
  _SynthesizeButtonState createState() => _SynthesizeButtonState();
}

class _SynthesizeButtonState extends State<SynthesizeButton> {

  VideoBloc videoBloc = VideoBloc();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        videoBloc.add(NewVideo(userId: widget.userId, workId: widget.workId));
      },
      child: Text("synthesize button"),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoBloc.close();
  }
}