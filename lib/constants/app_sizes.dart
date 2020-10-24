import 'package:flutter/material.dart';

class AppSizes {
  static double inputHeight = 50;
  static double userProfilePictureImageHeight = 100;
  static double userProfilePictureImageWidth = 100;

  static double borderRadius = 20;

  static ShapeBorder containerTopRadiusShape() => RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      );

  static BorderRadiusGeometry containerTopBorderRadiusShape() =>
      BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      );

  static BorderRadiusGeometry containerBottomBorderRadiusShape() =>
      BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      );

  static BorderRadiusGeometry containerBorderRadiusShape(
          {double radius = 30}) =>
      BorderRadius.all(
        Radius.circular(radius),
      );
}
