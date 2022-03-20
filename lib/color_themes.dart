import 'package:flutter/material.dart';


class AppColors{
  static const blackText = Color(0xff201f21);
  static const appBgColor = Color(0xffe3e3e3);
  static const iconsClr = Colors.black38;
  static const appPrimary = Colors.green;
  static const appGradient = LinearGradient(
    colors: [
      const Color(0xFF196F3D),
      const Color(0xFF00FF00),
    ],
    begin: const FractionalOffset(0.0, 0.2),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );
  static const secondGradient = LinearGradient(
    colors: [
      Color(0xffffce00),
      Color(0xfff0ff00)
    ],
    begin: const FractionalOffset(0.0, 0.2),
    end: const FractionalOffset(1.0, 0.0),
    stops: [0.0, 1.0],
    tileMode: TileMode.clamp,
  );


}

const kDefaultPaddin = 15.0;

