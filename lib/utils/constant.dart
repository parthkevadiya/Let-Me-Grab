import 'package:flutter/material.dart';

class AppImage {
  static const String imagePath = "assets/img/";
  static const String splash = "${imagePath}splash.png";
}

class AppColor {
  static const Color primaryColor = Color(0xffB56415);
  static const Color primaryBgColor = Color(0xffFCECFF);
  static const Color secondaryColor = Color(0xff1B0E2D);
  static const Color white = Color(0xffFFFFFF);
  static const Color gray = Color(0xff95929E);
}

class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://newsapi.org";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static const String apiKey = "99e1f146f8624bf48eea59a630d15ce6";
  static const String news = '/v2/everything';
}
