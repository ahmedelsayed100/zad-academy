import 'package:flutter/material.dart';

import '../constant_values.dart';

const selectedFontFamily = "Lateef";

final appTheme = ThemeData(
  fontFamily: selectedFontFamily,
  primarySwatch: Colors.amber,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 2,
    titleTextStyle: TextStyle(
      fontFamily: selectedFontFamily,
      color: ConstantValues.bkColor,
      fontWeight: FontWeight.w500,
      fontSize: 25,
    ),
  ),
);
