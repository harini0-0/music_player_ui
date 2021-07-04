import 'package:flutter/material.dart';


class BottomLeftBgClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 370;
    final double _yScaling = size.height / 807;
    path.lineTo(-85.8912 * _xScaling,142.388 * _yScaling);
    path.cubicTo(-34.0201 * _xScaling,130.413 * _yScaling,11.0669 * _xScaling,91.6761 * _yScaling,66.5766 * _xScaling,102.544 * _yScaling,);
    path.cubicTo(122.119 * _xScaling,113.418 * _yScaling,168.648 * _xScaling,165.375 * _yScaling,218.439 * _xScaling,201.97 * _yScaling,);
    path.cubicTo(267.351 * _xScaling,237.919 * _yScaling,324.885 * _xScaling,263.894 * _yScaling,358.91 * _xScaling,317.401 * _yScaling,);
    path.cubicTo(392.814 * _xScaling,370.716 * _yScaling,393.723 * _xScaling,435.808 * _yScaling,405.784 * _xScaling,496.579 * _yScaling,);
    path.cubicTo(417.205 * _xScaling,554.128 * _yScaling,430.011 * _xScaling,611.078 * _yScaling,428.401 * _xScaling,667.544 * _yScaling,);
    path.cubicTo(426.713 * _xScaling,726.733 * _yScaling,424.117 * _xScaling,788.854 * _yScaling,396.149 * _xScaling,834.472 * _yScaling,);
    path.cubicTo(368.2 * _xScaling,880.059 * _yScaling,314.161 * _xScaling,893.222 * _yScaling,272.099 * _xScaling,922.488 * _yScaling,);
    path.cubicTo(227.569 * _xScaling,953.471 * _yScaling,195.369 * _xScaling,1012.46 * _yScaling,139.219 * _xScaling,1013.24 * _yScaling,);
    path.cubicTo(82.9956 * _xScaling,1014.02 * _yScaling,31.44 * _xScaling,957.239 * _yScaling,-22.6558 * _xScaling,926.574 * _yScaling,);
    path.cubicTo(-72.2668 * _xScaling,898.451 * _yScaling,-122.625 * _xScaling,875.769 * _yScaling,-168.39 * _xScaling,838.865 * _yScaling,);
    path.cubicTo(-217.948 * _xScaling,798.903 * _yScaling,-275.289 * _xScaling,761.069 * _yScaling,-302.481 * _xScaling,700.928 * _yScaling,);
    path.cubicTo(-329.673 * _xScaling,640.785 * _yScaling,-312.924 * _xScaling,576.222 * _yScaling,-315.664 * _xScaling,513.137 * _yScaling,);
    path.cubicTo(-318.316 * _xScaling,452.081 * _yScaling,-330.1 * _xScaling,389.794 * _yScaling,-318.471 * _xScaling,332.749 * _yScaling,);
    path.cubicTo(-306.26 * _xScaling,272.851 * _yScaling,-289.302 * _xScaling,209.733 * _yScaling,-246.707 * _xScaling,174.87 * _yScaling,);
    path.cubicTo(-204.252 * _xScaling,140.122 * _yScaling,-139.631 * _xScaling,154.795 * _yScaling,-85.8912 * _xScaling,142.388 * _yScaling,);
    path.cubicTo(-85.8912 * _xScaling,142.388 * _yScaling,-85.8912 * _xScaling,142.388 * _yScaling,-85.8912 * _xScaling,142.388 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}
class BottomLeftClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 370;
    final double _yScaling = size.height / 807;
    path.lineTo(15.8844 * _xScaling,122.032 * _yScaling);
    path.cubicTo(41.7322 * _xScaling,115.818 * _yScaling,64.4102 * _xScaling,96.6306 * _yScaling,91.895 * _xScaling,101.507 * _yScaling,);
    path.cubicTo(119.396 * _xScaling,106.385 * _yScaling,142.116 * _xScaling,131.325 * _yScaling,166.569 * _xScaling,148.764 * _yScaling,);
    path.cubicTo(190.591 * _xScaling,165.895 * _yScaling,218.969 * _xScaling,178.109 * _yScaling,235.467 * _xScaling,203.895 * _yScaling,);
    path.cubicTo(251.907 * _xScaling,229.59 * _yScaling,251.874 * _xScaling,261.261 * _yScaling,257.411 * _xScaling,290.746 * _yScaling,);
    path.cubicTo(262.655 * _xScaling,318.668 * _yScaling,268.591 * _xScaling,346.289 * _yScaling,267.371 * _xScaling,373.781 * _yScaling,);
    path.cubicTo(266.093 * _xScaling,402.598 * _yScaling,264.341 * _xScaling,432.85 * _yScaling,250.113 * _xScaling,455.259 * _yScaling,);
    path.cubicTo(235.895 * _xScaling,477.652 * _yScaling,208.962 * _xScaling,484.46 * _yScaling,187.856 * _xScaling,499.016 * _yScaling,);
    path.cubicTo(165.513 * _xScaling,514.425 * _yScaling,149.084 * _xScaling,543.374 * _yScaling,121.194 * _xScaling,544.171 * _yScaling,);
    path.cubicTo(93.2682 * _xScaling,544.968 * _yScaling,68.0885 * _xScaling,517.718 * _yScaling,41.4531 * _xScaling,503.197 * _yScaling,);
    path.cubicTo(17.0259 * _xScaling,489.879 * _yScaling,-7.81309 * _xScaling,479.216 * _yScaling,-30.2651 * _xScaling,461.596 * _yScaling,);
    path.cubicTo(-54.5775 * _xScaling,442.517 * _yScaling,-82.7712 * _xScaling,424.531 * _yScaling,-95.8271 * _xScaling,395.465 * _yScaling,);
    path.cubicTo(-108.883 * _xScaling,366.398 * _yScaling,-100.086 * _xScaling,334.852 * _yScaling,-100.977 * _xScaling,304.171 * _yScaling,);
    path.cubicTo(-101.84 * _xScaling,274.477 * _yScaling,-107.228 * _xScaling,244.252 * _yScaling,-101.029 * _xScaling,216.404 * _yScaling,);
    path.cubicTo(-94.5197 * _xScaling,187.162 * _yScaling,-85.6289 * _xScaling,156.319 * _yScaling,-64.217 * _xScaling,139.036 * _yScaling,);
    path.cubicTo(-42.8756 * _xScaling,121.809 * _yScaling,-10.8945 * _xScaling,128.469 * _yScaling,15.8844 * _xScaling,122.032 * _yScaling,);
    path.cubicTo(15.8844 * _xScaling,122.032 * _yScaling,15.8844 * _xScaling,122.032 * _yScaling,15.8844 * _xScaling,122.032 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}