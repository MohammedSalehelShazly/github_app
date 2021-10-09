import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_app/models/userModel.dart';
import 'package:github_app/modules/home/homeScreen.dart';
import 'package:github_app/shared/components/appDialog.dart';
import 'package:github_app/shared/components/staticVariables.dart';
import 'package:github_app/shared/network/local/sharedPreferencesHelper.dart';
import 'package:github_app/shared/network/remote/dioHelper.dart';

class LoginProvider with ChangeNotifier{

  TextEditingController emailCtrl;
  TextEditingController tokenCtrl;
  FocusNode emailFocusNode;
  FocusNode tokenFocusNode;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  setCtrl(){
    emailCtrl = TextEditingController();
    tokenCtrl = TextEditingController();
    emailFocusNode = FocusNode();
    tokenFocusNode = FocusNode();
  }
  disposeCtrl(){
    emailCtrl.dispose();
    tokenCtrl.dispose();
    emailFocusNode.dispose();
    tokenFocusNode.dispose();
  }

  SharedPreferencesHelper sharedPrefsHelper = SharedPreferencesHelper();



  DioHelper dioHelper = DioHelper();

  User user;


  login(BuildContext context) async{
    Response response = await dioHelper.get(
        context,
        path: 'https://api.github.com/user',
        token: tokenCtrl.text
    );

    if(response.statusCode ==200){
      user = User.fromJson(response.data);
      sharedPrefsHelper.setToken(tokenCtrl.text.trim());
      print('Login Done............................');
      Navigator.push(context, CupertinoPageRoute(builder: (_)=>
          HomeScreen()
      ));

    }else{
      staticVars.showToast(context, 'please check a data entered');
    }

  }







}