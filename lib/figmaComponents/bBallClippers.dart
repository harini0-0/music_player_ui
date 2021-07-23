import 'package:flutter/material.dart';

class TopLeftDribble extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(30.8944 * _xScaling,118.052 * _yScaling);
    path.cubicTo(28.8237 * _xScaling,124.786 * _yScaling,33.3971 * _xScaling,131.569 * _yScaling,40.3752 * _xScaling,132.537 * _yScaling,);
    path.cubicTo(56.6222 * _xScaling,134.792 * _yScaling,73.809 * _xScaling,136.051 * _yScaling,90.457 * _xScaling,136.051 * _yScaling,);
    path.cubicTo(117.506 * _xScaling,136.051 * _yScaling,143.673 * _xScaling,132.872 * _yScaling,167.751 * _xScaling,127.257 * _yScaling,);
    path.cubicTo(175.41 * _xScaling,125.471 * _yScaling,179.1 * _xScaling,116.904 * _yScaling,175.216 * _xScaling,110.066 * _yScaling,);
    path.cubicTo(158.632 * _xScaling,80.8655 * _yScaling,138.537 * _xScaling,53.7835 * _yScaling,115.3 * _xScaling,30.1915 * _yScaling,);
    path.cubicTo(111.512 * _xScaling,26.3452 * _yScaling,105.608 * _xScaling,25.5132 * _yScaling,101.006 * _xScaling,28.3363 * _yScaling,);
    path.cubicTo(68.1805 * _xScaling,48.474 * _yScaling,42.4333 * _xScaling,80.5296 * _yScaling,30.8944 * _xScaling,118.052 * _yScaling,);
    path.cubicTo(30.8944 * _xScaling,118.052 * _yScaling,30.8944 * _xScaling,118.052 * _yScaling,30.8944 * _xScaling,118.052 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}
class TopRightDribble extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(161.733 * _xScaling,97.4209 * _yScaling);
    path.cubicTo(169.52 * _xScaling,88.7427 * _yScaling,174.708 * _xScaling,79.7381 * _yScaling,177.489 * _xScaling,70.5141 * _yScaling,);
    path.cubicTo(178.765 * _xScaling,66.2839 * _yScaling,177.063 * _xScaling,61.8003 * _yScaling,173.557 * _xScaling,59.1114 * _yScaling,);
    path.cubicTo(146.913 * _xScaling,38.6761 * _yScaling,113.67 * _xScaling,26 * _yScaling,77.6211 * _xScaling,26 * _yScaling,);
    path.cubicTo(64.389 * _xScaling,26 * _yScaling,51.5643 * _xScaling,27.6999 * _yScaling,39.2931 * _xScaling,30.8171 * _yScaling,);
    path.cubicTo(30.582 * _xScaling,33.03 * _yScaling,28.2233 * _xScaling,43.7962 * _yScaling,34.2328 * _xScaling,50.4794 * _yScaling,);
    path.cubicTo(55.5174 * _xScaling,74.1498 * _yScaling,73.9608 * _xScaling,100.732 * _yScaling,89.3234 * _xScaling,129.054 * _yScaling,);
    path.cubicTo(92.3082 * _xScaling,134.557 * _yScaling,98.8584 * _xScaling,137.186 * _yScaling,104.648 * _xScaling,134.804 * _yScaling,);
    path.cubicTo(128.483 * _xScaling,124.997 * _yScaling,148.336 * _xScaling,112.358 * _yScaling,161.733 * _xScaling,97.4209 * _yScaling,);
    path.cubicTo(161.733 * _xScaling,97.4209 * _yScaling,161.733 * _xScaling,97.4209 * _yScaling,161.733 * _xScaling,97.4209 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}
class MiddleLeftDribble extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(30 * _xScaling,48 * _yScaling);
    path.cubicTo(30 * _xScaling,89.1337 * _yScaling,46.645 * _xScaling,127.085 * _yScaling,72.7295 * _xScaling,155.409 * _yScaling,);
    path.cubicTo(79.2806 * _xScaling,162.523 * _yScaling,90.7558 * _xScaling,158.357 * _yScaling,93.7939 * _xScaling,149.176 * _yScaling,);
    path.cubicTo(99.4663 * _xScaling,132.034 * _yScaling,108.811 * _xScaling,115.615 * _yScaling,121.677 * _xScaling,101.188 * _yScaling,);
    path.cubicTo(140.531 * _xScaling,80.0494 * _yScaling,165.771 * _xScaling,63.5483 * _yScaling,194.463 * _xScaling,52.8189 * _yScaling,);
    path.cubicTo(201.227 * _xScaling,50.2895 * _yScaling,204.915 * _xScaling,42.7833 * _yScaling,202.067 * _xScaling,36.1468 * _yScaling,);
    path.cubicTo(201.808 * _xScaling,35.541 * _yScaling,201.546 * _xScaling,34.936 * _yScaling,201.284 * _xScaling,34.3318 * _yScaling,);
    path.cubicTo(198.825 * _xScaling,28.6748 * _yScaling,192.507 * _xScaling,25.8569 * _yScaling,186.539 * _xScaling,27.412 * _yScaling,);
    path.cubicTo(158.892 * _xScaling,34.6146 * _yScaling,128.403 * _xScaling,38.6836 * _yScaling,96.457 * _xScaling,38.6836 * _yScaling,);
    path.cubicTo(79.0473 * _xScaling,38.6836 * _yScaling,61.0778 * _xScaling,37.3681 * _yScaling,44.0506 * _xScaling,35.0131 * _yScaling,);
    path.cubicTo(36.8699 * _xScaling,34.02 * _yScaling,30.0987 * _xScaling,39.1077 * _yScaling,30.0101 * _xScaling,46.3562 * _yScaling,);
    path.cubicTo(30.0034 * _xScaling,46.9033 * _yScaling,30 * _xScaling,47.4513 * _yScaling,30 * _xScaling,48 * _yScaling,);
    path.cubicTo(30 * _xScaling,48 * _yScaling,30 * _xScaling,48 * _yScaling,30 * _xScaling,48 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}
class MiddleRightDribble extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(98.5986 * _xScaling,45.8671 * _yScaling);
    path.cubicTo(83.8909 * _xScaling,62.2596 * _yScaling,63.0267 * _xScaling,76.0185 * _yScaling,38.1518 * _xScaling,86.7126 * _yScaling,);
    path.cubicTo(31.523 * _xScaling,89.5624 * _yScaling,28.3058 * _xScaling,97.2563 * _yScaling,31.0722 * _xScaling,103.92 * _yScaling,);
    path.cubicTo(31.501 * _xScaling,104.953 * _yScaling,31.926 * _xScaling,105.988 * _yScaling,32.3473 * _xScaling,107.025 * _yScaling,);
    path.cubicTo(34.655 * _xScaling,112.706 * _yScaling,40.6691 * _xScaling,115.956 * _yScaling,46.7141 * _xScaling,114.929 * _yScaling,);
    path.cubicTo(59.0275 * _xScaling,112.838 * _yScaling,71.6512 * _xScaling,111.684 * _yScaling,84.4688 * _xScaling,111.684 * _yScaling,);
    path.cubicTo(109.291 * _xScaling,111.684 * _yScaling,133.436 * _xScaling,115.714 * _yScaling,155.831 * _xScaling,123.15 * _yScaling,);
    path.cubicTo(157.32 * _xScaling,123.645 * _yScaling,159 * _xScaling,122.568 * _yScaling,159 * _xScaling,121 * _yScaling,);
    path.cubicTo(159 * _xScaling,87.4717 * _yScaling,148.439 * _xScaling,56.424 * _yScaling,130.56 * _xScaling,30.8247 * _yScaling,);
    path.cubicTo(125.167 * _xScaling,23.1023 * _yScaling,113.445 * _xScaling,25.3096 * _yScaling,108.323 * _xScaling,33.2144 * _yScaling,);
    path.cubicTo(105.523 * _xScaling,37.5356 * _yScaling,102.283 * _xScaling,41.7614 * _yScaling,98.5986 * _xScaling,45.8671 * _yScaling,);
    path.cubicTo(98.5986 * _xScaling,45.8671 * _yScaling,98.5986 * _xScaling,45.8671 * _yScaling,98.5986 * _xScaling,45.8671 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}
class BottomLeftDribble extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(59.5884 * _xScaling,70.5885 * _yScaling);
    path.cubicTo(43.0682 * _xScaling,89.1138 * _yScaling,33.371 * _xScaling,110.524 * _yScaling,30.6849 * _xScaling,132.626 * _yScaling,);
    path.cubicTo(30.1404 * _xScaling,137.107 * _yScaling,32.4106 * _xScaling,141.428 * _yScaling,36.3428 * _xScaling,143.643 * _yScaling,);
    path.cubicTo(59.2234 * _xScaling,156.534 * _yScaling,85.5397 * _xScaling,164 * _yScaling,113.621 * _xScaling,164 * _yScaling,);
    path.cubicTo(126.501 * _xScaling,164 * _yScaling,139.019 * _xScaling,162.436 * _yScaling,151.012 * _xScaling,159.513 * _yScaling,);
    path.cubicTo(156.382 * _xScaling,158.205 * _yScaling,159.966 * _xScaling,153.236 * _yScaling,159.768 * _xScaling,147.712 * _yScaling,);
    path.cubicTo(158.369 * _xScaling,108.714 * _yScaling,151.978 * _xScaling,70.4042 * _yScaling,141.017 * _xScaling,34.4895 * _yScaling,);
    path.cubicTo(139.062 * _xScaling,28.0848 * _yScaling,132.242 * _xScaling,24.5426 * _yScaling,125.956 * _xScaling,26.8534 * _yScaling,);
    path.cubicTo(99.6872 * _xScaling,36.5116 * _yScaling,76.6629 * _xScaling,51.4428 * _yScaling,59.5884 * _xScaling,70.5885 * _yScaling,);
    path.cubicTo(59.5884 * _xScaling,70.5885 * _yScaling,59.5884 * _xScaling,70.5885 * _yScaling,59.5884 * _xScaling,70.5885 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}
class BottomRightDribble extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 812;
    path.lineTo(139.522 * _xScaling,49.1723 * _yScaling);
    path.cubicTo(140.702 * _xScaling,43.4711 * _yScaling,137.369 * _xScaling,37.858 * _yScaling,131.824 * _xScaling,36.0846 * _yScaling,);
    path.cubicTo(111.93 * _xScaling,29.7223 * _yScaling,90.5023 * _xScaling,26.3164 * _yScaling,68.4688 * _xScaling,26.3164 * _yScaling,);
    path.cubicTo(58.9614 * _xScaling,26.3164 * _yScaling,49.5673 * _xScaling,26.978 * _yScaling,40.3574 * _xScaling,28.2246 * _yScaling,);
    path.cubicTo(32.9625 * _xScaling,29.2256 * _yScaling,28.606 * _xScaling,36.8003 * _yScaling,30.7382 * _xScaling,43.9515 * _yScaling,);
    path.cubicTo(40.2007 * _xScaling,75.6878 * _yScaling,46.2989 * _xScaling,109.173 * _yScaling,48.6852 * _xScaling,143.282 * _yScaling,);
    path.cubicTo(49.3039 * _xScaling,152.125 * _yScaling,58.511 * _xScaling,157.804 * _yScaling,66.0923 * _xScaling,153.211 * _yScaling,);
    path.cubicTo(103.25 * _xScaling,130.696 * _yScaling,130.438 * _xScaling,93.057 * _yScaling,139.522 * _xScaling,49.1723 * _yScaling,);
    path.cubicTo(139.522 * _xScaling,49.1723 * _yScaling,139.522 * _xScaling,49.1723 * _yScaling,139.522 * _xScaling,49.1723 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}