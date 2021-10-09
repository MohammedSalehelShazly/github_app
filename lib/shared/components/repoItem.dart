import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_app/models/userRepos.dart';
import 'package:github_app/modules/details/repoDetailsScreen.dart';
import 'package:github_app/shared/components/appListTile.dart';

class RepoItem extends StatelessWidget {

  Repo repoData;

  RepoItem({
    @required this.repoData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AppListTile(
        txt: repoData.name,
        isPrivate: repoData.private,
        updateAt: repoData.updatedAt,
        description: repoData.description,
        onTap: (){
          Navigator.push(context, CupertinoPageRoute(builder: (_)=>
              RepoDetailsScreen(repoData: repoData)
          ));
        },
      ),
    );
  }
}
