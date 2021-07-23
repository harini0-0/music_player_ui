import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Controller extends ChangeNotifier{
  Duration currentdd = Duration.zero;
  Duration dd = Duration.zero;
  bool sidebarCheck = false;
  late AudioPlayer audioPlayer =AudioPlayer();
  int currentIndex = 0;
  IconData playerIcon = Icons.play_arrow_rounded;
  void spltoggle(){
    playerIcon = Icons.pause_rounded;
    print("toggled");
    notifyListeners();
  }
  void togglePlayerIcon(){
    if(playerIcon == Icons.play_arrow_rounded){
      playerIcon = Icons.pause_rounded;
    }
    else
      playerIcon = Icons.play_arrow_rounded;
    notifyListeners();
  }
  void toggleSidebarChecker(){
    sidebarCheck = !sidebarCheck;
    notifyListeners();
  }
  void updateCurrentIndex(int index){
    currentIndex = index;
    notifyListeners();
  }
  void currentPos (event){
    currentdd = event;
    notifyListeners();
  }
  void Pos(event){
    dd=event;
    notifyListeners();
  }
  void stopPos(){
    currentdd = Duration.zero;
    notifyListeners();
  }
}