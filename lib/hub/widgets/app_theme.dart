import 'package:flutter/material.dart';

import 'repeated_data.dart';

const selectedFontFamily = "Lateef";

final appTheme = ThemeData(
  fontFamily: selectedFontFamily,
  primarySwatch: Colors.amber,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 2,
    titleTextStyle: TextStyle(
      fontFamily: selectedFontFamily,
      color: ConstantValues.blackColor,
      fontWeight: FontWeight.w500,
      fontSize: 25,
    ),
  ),
);
