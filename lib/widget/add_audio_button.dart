import 'package:client/widget/bloc/audio_bloc.dart';
import 'package:flutter/material.dart';

class AddAudioButton extends StatefulWidget {
  AddAudioButton({Key key, @required this.id}) : super(key: key);

  // work id
  final id;

  @override
  _AddAudioButtonState createState() => _AddAudioButtonState();
}

class _AddAudioButtonState extends State<AddAudioButton> {

  AudioBloc audioBloc = AudioBloc();

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        audioBloc.add(NewAudio(id: widget.id));
      },
      child: Text("add audio button."),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioBloc.close();
  }
}