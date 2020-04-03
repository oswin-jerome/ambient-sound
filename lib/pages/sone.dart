import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Sone extends StatefulWidget {
  Function click;
  Function isPlaying;
  Function pause;
  Sone({this.click, this.isPlaying, this.pause});
  @override
  _SoneState createState() => _SoneState();
}

class _SoneState extends State<Sone> {
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    isPlaying = widget.isPlaying();
    checkPlay();
  }

  checkPlay() async {
    Timer.periodic(Duration(microseconds: 100), (s) {
      setState(() {
        isPlaying = widget.isPlaying();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      child: Center(
        child: GestureDetector(
          onTap: () {
            checkPlay();
            print(widget.isPlaying());
            if(isPlaying){
              widget.pause();
            }else{
            widget.click("assets/Rain-ambience.mp3");

            }
          },
          onDoubleTap: () {
            checkPlay();
          },
          onLongPress: () {
            widget.pause();
          },
          child: FlareActor(
            "assets/ani2.flr",
            animation: isPlaying ? "play" : "none",
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
