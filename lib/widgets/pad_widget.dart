import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:launch_pad/utils/sound_consts.dart';

class Pad extends StatefulWidget {
  Color centerColor;
  Color outlineColor;
  int index;
  Pad(
      {required this.centerColor,
      required this.outlineColor,
      required this.index});

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  @override
  void initState() {
    _centerColor = widget.centerColor;
    _outlineColor = widget.outlineColor;
    // TODO: implement initState
    super.initState();
  }

  final player = AudioPlayer();
  late Color _centerColor;
  late Color _outlineColor;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _centerColor = Colors.white;
          _outlineColor = Colors.white;
          player.play(AssetSource(sounds[widget.index]));
        });
        await Future.delayed(Duration(seconds: 1));
        setState(() {
          _centerColor = widget.centerColor;
          _outlineColor = widget.outlineColor;
        });
      },
      child: Container(
        height: height / 8.2,
        width: width / 4.3,
        decoration: BoxDecoration(
          // color: backgroudColor[index],
          borderRadius: BorderRadius.circular(7),
          gradient: RadialGradient(
            colors: [
              _centerColor,
              _outlineColor,
            ],
            radius: 0.5,
          ),
          boxShadow: [
            BoxShadow(color: Colors.pinkAccent, blurRadius: 5.0),
          ],
        ),
      ),
    );
    ;
  }
}
