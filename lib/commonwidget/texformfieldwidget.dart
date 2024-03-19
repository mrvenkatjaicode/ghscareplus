import 'dart:core';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextBoxWidget extends StatelessWidget {
  TextBoxWidget({
    required this.fillColor,
    this.hintText,
    this.height,
    super.key,
    this.width,
    this.cursorHeight,
    this.fontColor
  });

  final Color fillColor;
  final String? hintText;
  final double? height;
  final double? width;
  double? cursorHeight;
  Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: TextFormField(
          style: TextStyle(color: fontColor),
          cursorColor: Colors.white,
          cursorHeight: cursorHeight,
          decoration: InputDecoration(
            filled: true,
            fillColor:
                fillColor, //Colors.transparent, // Set background color to transparent
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w600,
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white70,
              ),
            ),
          ),
        ));
  }
}
