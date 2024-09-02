import 'package:flutter/material.dart';
import 'package:super_weather/Theme/color.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
      surface: AppColor().lbg,
      onSurface: AppColor().lText,
      primary: AppColor().lContainer),
);

var darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
        primary: AppColor().dContainer,
        surface: AppColor().dbg,
        onSurface: AppColor().dText));
