import 'package:flutter/material.dart';

final Color primaryColor = Color(0xffedd3cb);
final Color darkPrimaryColor = Color(0xff6f3d2e);
final Color primaryColor2 = Color(0xffF5924B);
final Color darkPrimaryColor2 = Color(0xffE6221C);
final Color bgColor =Color(0xff22272B);

BoxShadow topRightClipperDec = BoxShadow(
  color: Colors.black26.withOpacity(0.1),
  offset: Offset(-3, 3),
  blurRadius: 5,
  spreadRadius: 5,
);
BoxShadow bottomLeftBgClipperDec = BoxShadow(
  color: Colors.red.withOpacity(0.5),
  offset: Offset(-3, 3),
  blurRadius: 5,
  spreadRadius: 9,
);

BoxShadow bottomLeftClipperDec = BoxShadow(
  color: Colors.black26.withOpacity(0.5),
  offset: Offset(-5, 1),
  blurRadius: 10,
  spreadRadius: 10,
);