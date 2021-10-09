import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper{

  const UrlLauncherHelper();

  _showSnackBar(BuildContext context, String msg){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg ,style: TextStyle(color: Colors.white),),
      backgroundColor: Color(0xff303030),
      duration: Duration(seconds: 2),
    ));
  }


  website(BuildContext context, String url) async{
    try{
      await launch( url,
          forceSafariVC: false,
          forceWebView: false);
    }on Exception catch(e){
      _showSnackBar(context, 'some error are happened');
    }
  }

}