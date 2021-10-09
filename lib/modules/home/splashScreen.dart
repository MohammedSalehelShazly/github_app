import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_app/logic/providers/mainProvider.dart';
import 'package:github_app/modules/home/homeScreen.dart';
import 'package:github_app/modules/login/loginScreen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool first = true;

  @override
  void didChangeDependencies() async{
    if(mounted && first){
      first = false;
      await Provider.of<MainProvider>(context, listen: false).getToken();

      Future.delayed(Duration(seconds: 2),(){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>

        Provider.of<MainProvider>(context).token == ''
            ? LoginScreen()
            : HomeScreen()
        ));

      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Transform.translate(
          offset: Offset(0, 50),
            child: Image.asset('assets/images/gif_logo_github.gif')),
      ),
    ));
  }
}
