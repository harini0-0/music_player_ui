import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:music_player_ui/widgets/songItemBubble.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:rxdart/rxdart.dart';

late AnimationController _animationController;
late StreamController<bool> isOpenStreamController;
late Stream<bool> isOpenStream;
late StreamSink<bool> isOpenStreamSink;

void onIconPressed(){
  final animationStatus = _animationController.status;
  final isAnimationCompleted = animationStatus == AnimationStatus.completed;
  if(isAnimationCompleted){
    isOpenStreamSink.add(false);
    _animationController.reverse();
  }
  else {
    isOpenStreamSink.add(true);
    _animationController.forward();
  }
}

class Sidebar extends StatefulWidget {
  final songs;
  const Sidebar({this.songs});

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> with SingleTickerProviderStateMixin<Sidebar>{
  bool isOpen = true;
  final _animationDuration = const Duration(milliseconds: 500);
  late final List<SongItemBubble> songsList = [];

  @override
  void initState() {
    super.initState();
    for(int i=0;i<widget.songs.length;i++){
      SongInfo newVar = widget.songs[i];
      SongItemBubble current = SongItemBubble(songVar: newVar, index: i,);
      songsList.add(current);
    }
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isOpenStreamController = PublishSubject<bool>();
    isOpenStream = isOpenStreamController.stream;
    isOpenStreamSink = isOpenStreamController.sink;
  }
  @override
  void dispose() {
    isOpenStreamController.close();
    _animationController.dispose();
    isOpenStreamSink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isOpenStream,
      builder: (context, snapshot) {
        isOpen = snapshot.data!;
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: snapshot.data! ? screenWidth * 1/11: screenWidth,
          right: 0,
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.red.withOpacity(0.5),
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: songsList,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  color: Colors.black45,
                  icon: Icon(Icons.close),
                  onPressed: (){
                    onIconPressed();
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}

