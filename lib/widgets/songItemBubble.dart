import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player_ui/controller.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';


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
              Provider.of<Controller>(context,listen: false).updateCurrentIndex(widget.index);
              Provider.of<Controller>(context, listen: false).stopPos();
              Provider.of<Controller>(context, listen: false).audioPlayer.stop();
              Provider.of<Controller>(context, listen: false).audioPlayer.play(widget.songVar.filePath, isLocal: true);
              if(Provider.of<Controller>(context,listen: false).audioPlayer.state == PlayerState.PAUSED || Provider.of<Controller>(context,listen: false).audioPlayer.state == PlayerState.STOPPED){
                setState(() {
                  Provider.of<Controller>(context, listen: false).spltoggle();
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.55),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(left: 8, top: 5, bottom: 5, right: 8),
              padding: EdgeInsets.all(5),
              child: Row(
                children: [
                  Flexible(
                    child: ClipOval(
                      child: Image.memory(
                        snapshot.data as Uint8List,
                        width: 35,
                        height: 35,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace)=> Image.asset("images/11.jpg", width: 30,height: 30, fit: BoxFit.contain,),
                      ),
                    ),
                  ),
                  SizedBox(
                  width: 8,
                  ),
                  Flexible(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // "${widget.songVar.displayName.length > 35 ? widget.songVar.displayName.substring(0, 20) : widget.songVar.displayName}",
                          "${widget.songVar.displayName}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          "${widget.songVar.artist}",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black45,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
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