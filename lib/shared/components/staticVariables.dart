import 'package:flutter/material.dart';
import 'package:github_app/modules/details/repoDetailsScreen.dart';

import '../../modules/home/homeScreen.dart';

import 'package:toast/toast.dart';

StaticVars staticVars = StaticVars();

class StaticVars{

  void showToast(BuildContext context ,String txt ,[bool isException = false]){
    if(txt!=null || '$txt'.trim()!='')
      Toast.show(
          isException && txt.length >50
              ? txt.substring(0,49)+'...'
              :txt,
          context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.BOTTOM);
  }

  final BorderRadius borderRadius = BorderRadius.circular(8);

  final Map<IconData ,dynamic> screensList = {
    Icons.home_outlined : HomeScreen(),
    Icons.info_outline : RepoDetailsScreen(),
  };

  IconData iconNotOutLined(IconData _icon){
    if(_icon == Icons.home_outlined)
      return Icons.home;
    else if(_icon == Icons.info_outline)
      return Icons.info;
    else return Icons.info;
  }







}