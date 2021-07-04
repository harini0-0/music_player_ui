import 'package:flutter/material.dart';

class TopRightClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(225.51 * _xScaling,-174.308 * _yScaling);
    path.cubicTo(250.223 * _xScaling,-181.119 * _yScaling,272.649 * _xScaling,-199.055 * _yScaling,298.304 * _xScaling,-196.299 * _yScaling,);
    path.cubicTo(323.975 * _xScaling,-193.542 * _yScaling,344.049 * _xScaling,-173.058 * _yScaling,366.164 * _xScaling,-159.199 * _yScaling,);
    path.cubicTo(387.889 * _xScaling,-145.585 * _yScaling,413.989 * _xScaling,-136.488 * _yScaling,428.15 * _xScaling,-114.93 * _yScaling,);
    path.cubicTo(442.261 * _xScaling,-93.4484 * _yScaling,440.513 * _xScaling,-65.87 * _yScaling,444.137 * _xScaling,-40.4969 * _yScaling,);
    path.cubicTo(447.568 * _xScaling,-16.469 * _yScaling,451.669 * _xScaling,7.25882 * _yScaling,449.028 * _xScaling,31.2624 * _yScaling,);
    path.cubicTo(446.261 * _xScaling,56.4238 * _yScaling,442.969 * _xScaling,82.8593 * _yScaling,428.337 * _xScaling,103.142 * _yScaling,);
    path.cubicTo(413.715 * _xScaling,123.411 * _yScaling,387.946 * _xScaling,130.798 * _yScaling,367.254 * _xScaling,144.616 * _yScaling,);
    path.cubicTo(345.348 * _xScaling,159.245 * _yScaling,328.286 * _xScaling,185.341 * _yScaling,301.941 * _xScaling,187.547 * _yScaling,);
    path.cubicTo(275.563 * _xScaling,189.755 * _yScaling,253.294 * _xScaling,167.393 * _yScaling,228.963 * _xScaling,156.192 * _yScaling,);
    path.cubicTo(206.649 * _xScaling,145.921 * _yScaling,183.802 * _xScaling,137.982 * _yScaling,163.584 * _xScaling,123.857 * _yScaling,);
    path.cubicTo(141.69 * _xScaling,108.562 * _yScaling,116.077 * _xScaling,94.4301 * _yScaling,105.341 * _xScaling,69.8294 * _yScaling,);
    path.cubicTo(94.6033 * _xScaling,45.2279 * _yScaling,104.61 * _xScaling,17.2839 * _yScaling,105.432 * _xScaling,-9.38204 * _yScaling,);
    path.cubicTo(106.228 * _xScaling,-35.1901 * _yScaling,102.785 * _xScaling,-61.2157 * _yScaling,110.141 * _xScaling,-85.7998 * _yScaling,);
    path.cubicTo(117.864 * _xScaling,-111.613 * _yScaling,127.92 * _xScaling,-138.951 * _yScaling,149.049 * _xScaling,-155.16 * _yScaling,);
    path.cubicTo(170.109 * _xScaling,-171.317 * _yScaling,199.908 * _xScaling,-167.251 * _yScaling,225.51 * _xScaling,-174.308 * _yScaling,);
    path.cubicTo(225.51 * _xScaling,-174.308 * _yScaling,225.51 * _xScaling,-174.308 * _yScaling,225.51 * _xScaling,-174.308 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}