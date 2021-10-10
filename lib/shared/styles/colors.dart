import 'package:flutter/material.dart';


AppClrs appClrs = AppClrs();

class AppClrs{

  Color mainColor = Color(0xff019e79);

  Color secondColor = Colors.yellow[700];
  Color scaffoldBackgroundColorDark = Color(0xff585858);


  String mainFontFamily = 'Cairo';
  String secondFontFamily = 'Amiri';

  ThemeData appThem()=> ThemeData(
    brightness: Brightness.light,
    fontFamily: mainFontFamily,
    primaryColor: mainColor,

    appBarTheme: AppBarTheme(
      color: mainColor,
      textTheme: TextTheme(
          headline6: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold ,fontFamily: mainFontFamily)
      ),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(color: mainColor ),
    ),
  );


}