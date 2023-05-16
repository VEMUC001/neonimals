import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(17, 15, 18, .1),
  100: const Color.fromRGBO(17, 15, 18, .2),
  200: const Color.fromRGBO(17, 15, 18, .3),
  300: const Color.fromRGBO(17, 15, 18, .4),
  400: const Color.fromRGBO(17, 15, 18, .5),
  500: const Color.fromRGBO(17, 15, 18, .6),
  600: const Color.fromRGBO(17, 15, 18, .7),
  700: const Color.fromRGBO(17, 15, 18, .8),
  800: const Color.fromRGBO(17, 15, 18, .9),
  900: const Color.fromRGBO(17, 15, 18, 1),
};

class Pallete {
  static MaterialColor customPrimaryColor = MaterialColor(0xFF110F12, color);
  static const Color primaryBackground = Color.fromRGBO(17, 15, 18, 1);
}
