import 'widgets/navBarItem.dart';
import 'constant.dart';
import 'widgets/clipperContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'figmaComponents/topRightClipper.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player_ui/controller.dart';
import 'figmaComponents/bottomLeftClippers.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart' show FlutterAudioQuery, SongInfo;
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'sidebarLayouts/sidebar.dart';

// IconData playerIcon = Icons.play_arrow_rounded;

class FigmaDesignScreen extends StatefulWidget {
  static String id="figmaDesignScreen";

  @override
  _FigmaDesignScreenState createState() => _FigmaDesignScreenState();
}

class _FigmaDesignScreenState extends State<FigmaDesignScreen> {
  late final FlutterAudioQuery audioQuery;
  var files;
  late List<SongInfo> songs;
  bool started = false;


  //String queryUrl = "/storage/emulated/0/Music/Uppukarauvadu.mp3";

  @override
  void initState() {
    super.initState();
    //Provider.of<Controller>(context).audioPlayer = AudioPlayer();
    audioQuery = FlutterAudioQuery();
    positionChanger();
  }
  @override
  void dispose() {
    Provider.of<Controller>(context, listen: false).audioPlayer.dispose();
    super.dispose();
  }
  void playLocal(String localPath) async {
    await Provider.of<Controller>(context, listen: false).audioPlayer.play(localPath, isLocal: true);
  }
  void playResume(){
    if(Provider.of<Controller>(context, listen: false).audioPlayer.state == PlayerState.PLAYING){
      Provider.of<Controller>(context, listen: false).audioPlayer.pause();
      setState(() {
        Provider.of<Controller>(context, listen: false).togglePlayerIcon();
      });
    }
    else if(Provider.of<Controller>(context, listen: false).audioPlayer.state == PlayerState.PAUSED){
      Provider.of<Controller>(context, listen: false).audioPlayer.resume();
      setState(() {
        Provider.of<Controller>(context, listen: false).togglePlayerIcon();
      });
    }
  }
  void positionChanger() async{
    var status = await Permission.storage.status;
    if(!status.isGranted)
      await Permission.storage.request();
    Provider.of<Controller>(context, listen: false).audioPlayer.onDurationChanged.listen((event) {
        Provider.of<Controller>(context,listen: false).Pos(event);
      });
    Provider.of<Controller>(context, listen: false).audioPlayer.onAudioPositionChanged.listen((event) {
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
          songs =  snapshot.data as List<SongInfo> ;
          return SafeArea(
            child: Scaffold(
              backgroundColor: bgColor,
              body: Stack(
                //alignment: Alignment.center,
                children: <Widget>[
                  ClipperContainer(
                      adjustM: 0.99,
                      type: 2,
                      shadowDesign: topRightClipperDec,
                      alignmentX: 30,
                      alignmentY: -1,
                      clipperItem: TopRightClipper(),
                      height: height,
                      width: width,
                  ),
                  ClipperContainer(
                      adjustM: 0.79,
                      type: 1,
                      shadowDesign:bottomLeftBgClipperDec,
                      alignmentX: 0,
                      alignmentY: 3.5,
                      clipperItem: BottomLeftBgClipper(),
                      height: height,
                      width: width
                  ),
                  ClipperContainer(
                      adjustM: 0.60,
                      type: 1,
                      shadowDesign:bottomLeftClipperDec,
                      alignmentX: 0,
                      alignmentY: 2.5,
                      clipperItem: BottomLeftClipper(),
                      height: height,
                      width: width
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
                              callbackFunction: (){
                                Navigator.pop(context);
                              },),
                            Text('Playing Now', style: TextStyle(fontSize: 25,
                                color: Colors.red,
                                fontWeight: FontWeight.w500),),
                            NavBarItem(
                              icon: Icons.queue_music_rounded,
                              callbackFunction: (){
                                setState(() {
                                  onIconPressed();
                                });
                                },
                            ),
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
                              stream: Provider.of<Controller>(context, listen: false).audioPlayer.onAudioPositionChanged,
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
                          stream: Provider.of<Controller>(context, listen: false).audioPlayer.onAudioPositionChanged,
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
                                  Provider.of<Controller>(context, listen: false).audioPlayer.seek(duration);
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
                            Icon(Icons.repeat, color: Colors.red),
                            IconButton(onPressed: null,
                                icon: Icon(Icons.skip_previous_rounded, color: Colors.red,)),
                            IconButton(onPressed: () {
                                  if (started == false) {
                                    setState(() {
                                      Provider.of<Controller>(context, listen: false).togglePlayerIcon();
                                    });
                                    //playLocal("storage/emulated/0/Music/Uppukarauvadu.mp3");
                                    playLocal(songs[0].filePath);
                                    started = true;
                                  }
                                  else
                                    playResume();
                                },
                                icon: Icon(Provider.of<Controller>(context, listen: false).playerIcon, color: Colors.red)),
                            IconButton(onPressed: null,
                                icon: Icon(Icons.skip_next_rounded, color: Colors.red)),
                            IconButton(onPressed: () {
                              Provider.of<Controller>(context, listen: false).audioPlayer.stop();
                              started = false;
                              setState(() {
                                Provider.of<Controller>(context, listen: false).togglePlayerIcon();
                                Provider.of<Controller>(context, listen: false).stopPos();
                              });
                            },
                                icon: Icon(Icons.stop_rounded, color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Sidebar(songs: songs,),
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
//   var files;
//   //List<FileSystemEntity> _songs = [];
//   // final List<Directory>? dir = await getExternalStorageDirectories();
//   // final Directory? dir2 = await getExternalStorageDirectory();
//   //if(dir!= null)
//     // for(int i=0;i<files.length;i++) {
//     //   print("${files[i]}");
//     // }
//   // var status = await Permission.storage.status;
//   // if(!status.isGranted)
//   //   await Permission.storage.request();
//   // if(status.isGranted){
//   //   //files = Directory("/storage/emulated/0/").listSync(recursive: true);
//   //   for(FileSystemEntity entity in files) {
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