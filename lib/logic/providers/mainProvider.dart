import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_app/models/userModel.dart';
import 'package:github_app/models/userRepos.dart';
import 'package:github_app/shared/components/appDialog.dart';
import 'package:github_app/shared/components/staticVariables.dart';
import 'package:github_app/shared/network/local/sharedPreferencesHelper.dart';
import 'package:github_app/shared/network/remote/dioHelper.dart';

class MainProvider with ChangeNotifier{

  SharedPreferencesHelper sharedPrefsHelper = SharedPreferencesHelper();

  String token = '';
  getToken() async{
    token = await sharedPrefsHelper.getToken();
    notifyListeners();
  }

  DioHelper dioHelper = DioHelper();

  User user;

  getUser(BuildContext context) async {
    Response response = await dioHelper.get(
        context,
        path: 'https://api.github.com/user',
        token: token
    );

    if (response.statusCode == 200) {
      user = User.fromJson(response.data);
    } else {
      staticVars.showToast(context, 'Some errors occurred');
    }
  }


  UserRepos userRepos;

  getRepos(BuildContext context) async{

    if(token =='')
      await getToken();

    Response response = await  dioHelper.get(context,
      path: 'https://api.github.com/user/repos',
      token: token
    );

    print('..................................................');
    print(response.data[0]['description']);
    print('..................................................');


    if(response.statusCode == 200){
      userRepos = UserRepos.fromRes(response.data);
      await getLanguages(context, userRepos);
      await filterRepos();

      notifyListeners();
    }else{
      staticVars.showToast(context, 'Some errors occurred');
    }

    print('response $response');

  }


  Map< String, List<String> > languages = {};
  // {
  //  repoName : [Dart, JavaScript, ..]
  // }

  getLanguages(BuildContext context, UserRepos _userRepos) async{
    for(int i=0; i<_userRepos.repos.length; i++){
      Response response = await dioHelper.get(context,
        path: _userRepos.repos[i].languagesUrl,
        token: token
      );
      languages[_userRepos.repos[i].name] = response.data.keys.toList();
    }
    print(languages);
    notifyListeners();
  }

  List<String> filterLangListChose = [
    'HTML',
    'Dart, Flutter',
    'Ruby',
    'Objective-C',
    'Swift',
    'Kotlin',
    'Java',
    'CSS',
    'Makefile',
  ];
  String filterLang = 'Dart, Flutter';
  changeFilterLang(String str){
    filterLang = str;
    notifyListeners();
  }

  List<String> filteredLanguages;

  filterRepos(){
    filteredLanguages = [];

    languages.forEach((key, value) {

      if(value.contains(filterLang)
          || ( filterLang=='Dart, Flutter' && value.contains('Dart'))){
        filteredLanguages.add(key);
      }
      notifyListeners();
    });
  }

}