import 'package:ambitent_sound/pages/sone.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final assetsAudioPlayer = AssetsAudioPlayer(); 
  @override
  void initState() {
    super.initState();
    
  }

  playAudio(file){
    assetsAudioPlayer.open(file);
    assetsAudioPlayer.play();
  }

  pauseAudio(){
    assetsAudioPlayer.pause();
  }
  isPlaying(){
    
    
    // FIXME:

    return assetsAudioPlayer.isPlaying.value;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PageView(
          children: <Widget>[
            Sone(click: (s){
              playAudio(s);
            },isPlaying: isPlaying,pause: pauseAudio,),
            Sone(click: (s){
              playAudio(s);
            },isPlaying: isPlaying,pause: pauseAudio,),
          ],
        ),
      ),
    );
  }
}