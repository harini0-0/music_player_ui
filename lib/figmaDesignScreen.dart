import 'navBarItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'figmaComponents/topRightClipper.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player_ui/controller.dart';
import 'figmaComponents/bottomLeftClippers.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart' show FlutterAudioQuery;
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

final Color primaryColor = Color(0xffedd3cb);
final Color darkPrimaryColor = Color(0xff6f3d2e);
final Color primaryColor2 = Color(0xffF5924B);
final Color darkPrimaryColor2 = Color(0xffE6221C);
final Color bgColor =Color(0xff22272B);


class FigmaDesignScreen extends StatefulWidget {
  static String id="figmaDesignScreen";

  @override
  _FigmaDesignScreenState createState() => _FigmaDesignScreenState();
}

class _FigmaDesignScreenState extends State<FigmaDesignScreen> {
  late final FlutterAudioQuery audioQuery;
  late AudioPlayer audioPlayer;
  var files,songs;
  bool started = false;
  IconData playerIcon = Icons.play_arrow_rounded;
  late Duration dd = Duration.zero;
  Duration currentdd = Duration.zero;

  //String queryUrl = "/storage/emulated/0/Music/Uppukarauvadu.mp3";

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    audioQuery = FlutterAudioQuery();
    positionChanger();
  }
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  void playLocal(String localPath) async {
    await audioPlayer.play(localPath, isLocal: true);
  }
  void playResume(){
    if(audioPlayer.state == PlayerState.PLAYING){
      audioPlayer.pause();
      setState(() {
        playerIcon = Icons.play_arrow_rounded;
      });
    }
    else if(audioPlayer.state == PlayerState.PAUSED){
      audioPlayer.resume();
      setState(() {
        playerIcon = Icons.pause_rounded;
      });
    }
  }
  void positionChanger() async{
    var status = await Permission.storage.status;
    if(!status.isGranted)
      await Permission.storage.request();
    audioPlayer.onDurationChanged.listen((event) {
        Provider.of<Controller>(context,listen: false).Pos(event);
      });
      audioPlayer.onAudioPositionChanged.listen((event) {
        Provider.of<Controller>(context,listen: false).currentPos(event);
      });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: audioQuery.getSongs(),
      builder: (context, snapshot){
        if(snapshot.hasData) {
          songs = snapshot.data;
          print(songs.length);
          return SafeArea(
            child: Scaffold(
              backgroundColor: bgColor,
              body: Stack(
                //alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment(30, -1),
                    child: ClipShadowPath(
                      shadow: BoxShadow(
                        color: Colors.black26.withOpacity(0.1),
                        offset: Offset(-3, 3),
                        blurRadius: 5,
                        spreadRadius: 5,
                      ),
                      clipper: TopRightClipper(),
                      child: Container(
                        width: width * 0.99,
                        color: bgColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 3.5),
                    child: ClipShadowPath(
                      shadow: BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        offset: Offset(-3, 3),
                        blurRadius: 5,
                        spreadRadius: 9,
                      ),
                      clipper: BottomLeftBgClipper(),
                      child: Container(
                        height: height * 0.79,
                        color: bgColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(0, 2.5),
                    child: ClipShadowPath(
                      shadow: BoxShadow(
                        color: Colors.black26.withOpacity(0.5),
                        offset: Offset(-5, 1),
                        blurRadius: 10,
                        spreadRadius: 10,
                      ),
                      clipper: BottomLeftClipper(),
                      child: Container(
                        height: height * 0.60,
                        color: bgColor,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 90,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            NavBarItem(icon: Icons.arrow_back,
                              callbackFunction: (){},),
                            Text('Playing Now', style: TextStyle(fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.w500),),
                            NavBarItem(
                              icon: Icons.list, callbackFunction: (){},),
                          ],
                        ),
                      ),
                      Center(
                        child: ClayContainer(
                          emboss: true,
                          color: bgColor.withOpacity(0.3),
                          height: 250,
                          width: 250,
                          borderRadius: 250,
                          child: StreamBuilder<Duration>(
                              stream: audioPlayer.onAudioPositionChanged,
                              builder: (context, snapshot) {
                                return AnimatedContainer(
                                  curve: Curves.linear,
                                  duration: Duration(seconds: Provider
                                      .of<Controller>(context, listen: false)
                                      .currentdd
                                      .inSeconds),
                                  transformAlignment: Alignment.center,
                                  transform: Matrix4.rotationZ(Provider
                                      .of<Controller>(context, listen: false)
                                      .currentdd
                                      .inSeconds * 0.09),
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(250),
                                      image: DecorationImage(
                                        image: AssetImage("images/11.jpg"),
                                        fit: BoxFit.contain,
                                      )
                                  ),
                                );
                              }
                          ),
                        ),
                      ),
                      StreamBuilder<Duration>(
                          stream: audioPlayer.onAudioPositionChanged,
                          builder: (context, snapshot) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12),
                              child: ProgressBar(
                                baseBarColor: primaryColor2,
                                progressBarColor: darkPrimaryColor2,
                                thumbColor: Colors.red,
                                bufferedBarColor: Colors.white30,
                                thumbRadius: 10,
                                progress: Provider
                                    .of<Controller>(context, listen: false)
                                    .currentdd,
                                total: Provider
                                    .of<Controller>(context, listen: false)
                                    .dd,
                                onSeek: (duration) {
                                  audioPlayer.seek(duration);
                                },
                              ),
                            );
                          }
                      ),
                      ClayContainer(
                        emboss: true,
                        color: bgColor,
                        height: 70,
                        width: 350,
                        borderRadius: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.repeat),
                            IconButton(onPressed: null,
                                icon: Icon(Icons.skip_previous_rounded)),
                            IconButton(
                                onPressed: () {
                                  if (started == false) {
                                    setState(() {
                                      playerIcon = Icons.pause_rounded;
                                    });
                                    //playLocal("storage/emulated/0/Music/Uppukarauvadu.mp3");
                                    //print(songs.length);
                                    playLocal(songs[733].filePath);
                                    started = true;
                                  }
                                  else
                                    playResume();
                                },
                                icon: Icon(playerIcon)),
                            IconButton(onPressed: null,
                                icon: Icon(Icons.skip_next_rounded)),
                            IconButton(onPressed: () {
                              audioPlayer.stop();
                              started = false;
                              setState(() {
                                playerIcon = Icons.play_arrow_rounded;
                                Provider.of<Controller>(context, listen: false)
                                    .stopPos();
                              });
                            },
                                icon: Icon(Icons.stop_rounded)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        else
            return Scaffold(body: Center(child: Text("Loading..."),),);
      },
    );
  }
}


@immutable
class ClipShadowPath extends StatelessWidget {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({
    required this.shadow,
    required this.clipper,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint()
      ..maskFilter = MaskFilter.blur(
        BlurStyle.solid,
        shadow.spreadRadius,
      );
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}





// Function fileReader = () async{
//   var filess;
//   //List<FileSystemEntity> _songs = [];
//   // final List<Directory>? dir = await getExternalStorageDirectories();
//   // final Directory? dir2 = await getExternalStorageDirectory();
//   //if(dir!= null)
//     // for(int i=0;i<filess.length;i++) {
//     //   print("${filess[i]}");
//     // }
//   // var status = await Permission.storage.status;
//   // if(!status.isGranted)
//   //   await Permission.storage.request();
//   // if(status.isGranted){
//   //   //filess = Directory("/storage/emulated/0/").listSync(recursive: true);
//   //   for(FileSystemEntity entity in filess) {
//   //     String path = entity.path;
//   //     if(path.endsWith('.mp3')) {
//   //       _songs.add(entity);
//   //       print(path);
//   //     }
//   //     print(path);
//   //   }
//   // }
//   //print(songs[1].filePath);
//   print("hi");
// };