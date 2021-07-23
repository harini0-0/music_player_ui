import 'constant.dart';
import 'loadingScreen.dart';
import 'widgets/navBarItem.dart';
import 'sidebarLayouts/sidebar.dart';
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
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';


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
    audioQuery = FlutterAudioQuery();
    positionChanger();
    Provider.of<Controller>(context,listen: false).audioPlayer.onPlayerCompletion.listen((event) {
      int next =  Provider.of<Controller>(context,listen: false).currentIndex;
      next = (next+1) % songs.length;
      Provider.of<Controller>(context,listen: false).audioPlayer.play(songs[next].filePath, isLocal: true);
      Provider.of<Controller>(context,listen: false).updateCurrentIndex(next);
    });
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
                                //Navigator.pop(context);
                              },),
                            NeumorphicText("Playing Now",
                              style: NeumorphicStyle(
                                color: Colors.red,
                                shadowLightColor: Color(0xff946f6f),
                                shadowDarkColor: Color(0xff130707),
                                depth: 3,
                              ),
                              textStyle: NeumorphicTextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
                      ), //AppHeader
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
                      ), //PlayDisk
                      StreamBuilder<Duration>(
                          stream: Provider.of<Controller>(context, listen: false).audioPlayer.onAudioPositionChanged,
                          builder: (context, snapshot) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                      songs[Provider.of<Controller>(context, listen: false).currentIndex].displayName,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic,
                                      letterSpacing: 0.5,
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Padding(
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
                                ),
                              ],
                            );
                          }
                      ), //Duration Slider
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
                            IconButton(
                                onPressed: (){
                                  if(Provider.of<Controller>(context,listen: false).currentIndex == 0)
                                    Provider.of<Controller>(context,listen: false).updateCurrentIndex(songs.length - 1);
                                  else
                                    Provider.of<Controller>(context,listen: false).updateCurrentIndex(Provider.of<Controller>(context,listen: false).currentIndex -1 );
                                  Provider.of<Controller>(context, listen: false).stopPos();
                                  Provider.of<Controller>(context, listen: false).audioPlayer.stop();
                                  Provider.of<Controller>(context, listen: false).audioPlayer.play(songs[Provider.of<Controller>(context,listen: false).currentIndex].filePath, isLocal: true);
                                  if(Provider.of<Controller>(context,listen: false).audioPlayer.state == PlayerState.PAUSED){
                                    setState(() {
                                      Provider.of<Controller>(context, listen: false).spltoggle();
                                    });
                                  }
                                },
                                icon: Icon(Icons.skip_previous_rounded, color: Colors.red,)),
                            IconButton(onPressed: () {
                                  if (started == false) {
                                    setState(() {
                                      Provider.of<Controller>(context, listen: false).togglePlayerIcon();
                                    });
                                    playLocal(songs[Provider.of<Controller>(context, listen: false).currentIndex].filePath);
                                    started = true;
                                  }
                                  else
                                    playResume();
                                },
                                icon: Icon(Provider.of<Controller>(context, listen: false).playerIcon, color: Colors.red)),
                            IconButton(
                                onPressed: (){
                                  if(Provider.of<Controller>(context,listen: false).currentIndex == songs.length - 1)
                                    Provider.of<Controller>(context,listen: false).updateCurrentIndex(0);
                                  else
                                    Provider.of<Controller>(context,listen: false).updateCurrentIndex(Provider.of<Controller>(context,listen: false).currentIndex + 1 );
                                  Provider.of<Controller>(context, listen: false).stopPos();
                                  Provider.of<Controller>(context, listen: false).audioPlayer.stop();
                                  Provider.of<Controller>(context, listen: false).audioPlayer.play(songs[Provider.of<Controller>(context,listen: false).currentIndex].filePath, isLocal: true);
                                  if(Provider.of<Controller>(context,listen: false).audioPlayer.state == PlayerState.PAUSED){
                                    setState(() {
                                      Provider.of<Controller>(context, listen: false).spltoggle();
                                    });
                                  }
                                },
                                icon: Icon(Icons.skip_next_rounded, color: Colors.red)),
                            IconButton(onPressed: () {
                              started = false;
                              setState(() {
                                if(Provider.of<Controller>(context,listen: false).audioPlayer.state == PlayerState.PLAYING){
                                  Provider.of<Controller>(context, listen: false).togglePlayerIcon();
                                }
                                Provider.of<Controller>(context, listen: false).stopPos();
                              });
                              Provider.of<Controller>(context, listen: false).audioPlayer.stop();
                            },
                                icon: Icon(Icons.stop_rounded, color: Colors.red)),
                          ],
                        ),
                      ), //Player Controller
                    ],
                  ),
                  Sidebar(songs: songs,),
                ],
              ),
            ),
          );
        }
        else
            return LoadingScreen();
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




//   //   //files = Directory("/storage/emulated/0/").listSync(recursive: true);
//   //   for(FileSystemEntity entity in files) {
//   //     String path = entity.path;
//   //     if(path.endsWith('.mp3')) {
//   //       _songs.add(entity);
//   //     }
//   //     print(path);
//   //   }
