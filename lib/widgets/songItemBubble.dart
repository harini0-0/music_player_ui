import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:music_player_ui/figmaDesignScreen.dart';
import 'package:provider/provider.dart';
import 'package:music_player_ui/controller.dart';

class SongItemBubble extends StatefulWidget {
  final SongInfo songVar;
  final file, image, index;
  SongItemBubble({required this.songVar, this.file, this.image, this.index});

  @override
  _SongItemBubbleState createState() => _SongItemBubbleState();
}

class _SongItemBubbleState extends State<SongItemBubble> {
  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: FlutterAudioQuery().getArtwork(type: ResourceType.SONG, id: widget.songVar.id),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return GestureDetector(
            onTap: (){
              if(Provider.of<Controller>(context, listen: false).audioPlayer.state == PlayerState.PLAYING || Provider.of<Controller>(context, listen: false).audioPlayer.state == PlayerState.PAUSED){
                Provider.of<Controller>(context, listen: false).stopPos();
                Provider.of<Controller>(context, listen: false).audioPlayer.stop();
                Provider.of<Controller>(context, listen: false).audioPlayer.play(widget.songVar.filePath, isLocal: true);
                  setState(() {
                    // print(Provider.of<Controller>(context, listen: false).playerIcon);
                    Provider.of<Controller>(context, listen: false).togglePlayerIcon();
                    // print(playerIcon);
                  });
                }
            },
            child: Container(
              margin: EdgeInsets.only(left: 8, top: 5, bottom: 5),
              child: Row(
                children: [
                  Flexible(
                    child: ClipOval(
                      child: Image.memory(
                        snapshot.data as Uint8List,
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace)=> Image.asset("images/11.jpg", width: 30,height: 30, fit: BoxFit.contain,),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Text(
                          "${widget.songVar.displayName.length > 35 ? widget.songVar.displayName.substring(0, 20) : widget.songVar.displayName}",
                        overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        else
          return Container(
            margin: EdgeInsets.only(left: 8, top: 5, bottom: 5),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset("images/11.jpg", width: 30,height: 30, fit: BoxFit.contain,),
                ),
                Text("${widget.songVar.displayName.length > 35 ? widget.songVar.displayName.substring(0, 20) : widget.songVar.displayName}..."),
              ],
            ),
          );
      },
    );
  }
}