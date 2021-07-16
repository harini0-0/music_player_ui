import 'package:flutter/material.dart';

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
        //color: Color(0xff22272b).withOpacity(0.6),
          color: bgColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.6),
              offset: Offset(3,3),
              spreadRadius: 3,
              blurRadius: 15,
            ),
            BoxShadow(
              color: Color(0xff30373c),
              //color: bgColor.withOpacity(0.6),
              offset: Offset(-3,-3),
              spreadRadius: 3,
              blurRadius: 15,
            )
          ]
      ),
      child: IconButton(color: Colors.red, icon: Icon(icon), onPressed: (){callbackFunction();},),

    );
  }

}