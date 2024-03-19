import 'package:flutter/material.dart';

var radiantColor = const LinearGradient(
  colors: [Color.fromRGBO(148, 0, 211, 1), Color.fromRGBO(75, 0, 130, 1)],
  stops: [0.25, 1],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

var radiantwhiteColor = const LinearGradient(
  colors: [Color.fromRGBO(240, 240, 240, 1), Color.fromRGBO(255, 255, 255, 1)],
  stops: [1, 1],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);

var blackColor = Colors.black;

var blueColor = const Color.fromRGBO(46, 49, 146, 1);//rgba(46,49,146,255)
var greyColor = const Color.fromRGBO(179, 182, 192, 1);//rgba(179,182,192,255)

var textColor = const Color.fromRGBO(75, 0, 130, 1);


var radiantTextColor = const LinearGradient(
  colors: [Color.fromRGBO(75, 0, 130, 1), Color.fromRGBO(75, 0, 130, 1)],
  stops: [1, 1],
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
