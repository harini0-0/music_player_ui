import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NavBarItem extends StatelessWidget{
  final IconData icon;
  final Function callbackFunction;
  final Color bgColor =Color(0xff22272B);
  NavBarItem({required this.icon, required this.callbackFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: bgColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
      ),
      child: NeumorphicButton(
        child: Icon(icon, color: Colors.red,),
        onPressed: (){callbackFunction();},
        style: NeumorphicStyle(
          color: bgColor.withOpacity(0.8),
          shadowDarkColor: Colors.black26.withOpacity(0.6),
          shadowLightColor: Color(0xff30373c),
          shape: NeumorphicShape.flat,
          shadowDarkColorEmboss: Colors.black26.withOpacity(0.7),
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        ),
      ),
    );
  }

}