import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Controller extends ChangeNotifier{
  Duration currentdd = Duration.zero;
  Duration dd = Duration.zero;

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