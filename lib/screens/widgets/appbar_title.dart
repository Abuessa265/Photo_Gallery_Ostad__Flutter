import 'package:flutter/material.dart';

import '../../Theme/text_theme.dart';

Widget appbarTitle(String title) => Text(
      title,
      style: TextThemes.getTextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 22,
          fontFamily: "Poppins",
          letterSpacing: 0.5),
    );
