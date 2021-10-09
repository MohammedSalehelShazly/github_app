import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_app/logic/providers/mainProvider.dart';
import 'package:github_app/models/commitsModel.dart';
import 'package:github_app/shared/network/remote/dioHelper.dart';
import 'package:provider/provider.dart';

class RepoDetailsProv with ChangeNotifier{

  DioHelper dioHelper = DioHelper();

  CommitsData commitsData;

  getCommits(BuildContext context, String commitsUrl)async{
    print(Provider.of<MainProvider>(context).token);
    Response response = await dioHelper.get(
      context,
      path: commitsUrl.replaceAll('{/sha}', ''),
      token: Provider.of<MainProvider>(context).token
    );


    if(response.statusCode ==200){
      commitsData = CommitsData.fromRes(response.data);
      notifyListeners();
    }













  }


}