import 'package:flutter/material.dart';

import '../figmaDesignScreen.dart';
import '../constant.dart';

class ClipperContainer extends StatelessWidget{
  final BoxShadow shadowDesign;
  final double alignmentX, alignmentY, height, width, adjustM;
  final int type;
  final CustomClipper<Path> clipperItem;
  ClipperContainer({required this.adjustM, required this.type, required this.shadowDesign, required this.alignmentX, required this.alignmentY, required this.clipperItem, required this.height, required this.width});
  @override
  Widget build(BuildContext context){
    if(type==1)
      return Align(
      alignment: Alignment(alignmentX, alignmentY),
      child: ClipShadowPath(
        shadow: shadowDesign,
        clipper: clipperItem,
        child: Container(
          height: height * adjustM,
          color: bgColor,
        ),
      ),
    );
    else
      return Align(
        alignment: Alignment(alignmentX, alignmentY),
        child: ClipShadowPath(
          shadow: shadowDesign,
          clipper: clipperItem,
          child: Container(
            width: width * adjustM,
            color: bgColor,
          ),
        ),
      );
  }
}

