import 'package:flutter/material.dart';

final ThemeData DarkTheme = ThemeData(
    primarySwatch: const MaterialColor(4280361249, {
      50: Color(0xfff2f2f2),
      100: Color(0xffe6e6e6),
      200: Color(0xffcccccc),
      300: Color(0xffb3b3b3),
      400: Color(0xff999999),
      500: Color(0xff808080),
      600: Color(0xff666666),
      700: Color(0xff4d4d4d),
      800: Color(0xff333333),
      900: Color(0xff191919)
    }),
    brightness: Brightness.dark,
    primaryColor: const Color(0xff212121),
    primaryColorLight: const Color(0xff9e9e9e),
    primaryColorDark: const Color(0xff000000),
    canvasColor: const Color(0xff303030),
    scaffoldBackgroundColor: const Color(0xff303030),
    bottomAppBarColor: const Color(0xff424242),
    cardColor: const Color(0xff424242),
    dividerColor: const Color(0x1fffffff),
    highlightColor: const Color(0x40cccccc),
    splashColor: const Color(0x40cccccc),
    selectedRowColor: const Color(0xfff5f5f5),
    unselectedWidgetColor: const Color(0xb3ffffff),
    disabledColor: const Color(0x62ffffff),
    toggleableActiveColor: const Color(0xff64ffda),
    secondaryHeaderColor: const Color(0xff9e9e9e),
    backgroundColor: const Color(0xff616161),
    dialogBackgroundColor: const Color(0xff424242),
    indicatorColor: const Color(0xff64ffda),
    hintColor: const Color(0x80ffffff),
    errorColor: const Color(0xffd32f2f),
    fontFamily: 'SFProRounded',
    primaryTextTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white
      ),
      titleMedium: TextStyle(
          color: Color(0x51ffffff)
      ),
    ));
