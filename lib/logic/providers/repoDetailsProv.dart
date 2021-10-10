import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:github_app/logic/providers/mainProvider.dart';
import 'package:github_app/models/commitsModel.dart';
import 'package:github_app/shared/network/remote/dioHelper.dart';
import 'package:provider/provider.dart';

class RepoDetailsProv with ChangeNotifier{

  DioHelper dioHelper = DioHelper();

  CommitsData commitsData;
  resetCommitData(){
    commitsData = null;
    notifyListeners();
  }

  getCommits(BuildContext context, String commitsUrl)async{

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


  Future<String> readmeContent({
    @required BuildContext context,
    @required String author,
    @required String repoName})async{

    Response response = await dioHelper.get(context,
        path: 'https://raw.githubusercontent.com/$author/$repoName/master/README.md',
        token: Provider.of<MainProvider>(context).token
    );
    return response.data;
  }

  getImagesInReadme(String data){
    imagesInReadme = imagesInReadmeFunc(data);
    print(imagesInReadme.length);
    notifyListeners();
  }
  List<String> imagesInReadme = [];

  List<String>imagesInReadmeFunc(String text){

    final urlRegExp = RegExp(
        r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?"
    );
    final urlMatches = urlRegExp.allMatches(text);
    List<String> urls = urlMatches.map(
            (urlMatch) => text.substring(urlMatch.start, urlMatch.end).replaceAll(')', ''))
        .toList();

    urls.removeWhere((element) => !isImage(element) );

    return urls;

  }

  bool isImage(String url)=>
      url.endsWith('png') ||
  url.endsWith('JPEG') ||
  url.endsWith('JFIF') ||
  url.endsWith('Exif') ||
  url.endsWith('TIFF') ||
  url.endsWith('GIF') ||
  url.endsWith('gif') ||
  url.endsWith('PNG') ||
  url.endsWith('WebP') ||
  url.endsWith('BAT') ;











}