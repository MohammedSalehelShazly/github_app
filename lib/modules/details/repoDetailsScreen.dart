import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_app/logic/providers/repoDetailsProv.dart';
import 'package:github_app/models/userRepos.dart';
import 'package:github_app/modules/details/commitScreen.dart';
import 'package:provider/provider.dart';

class RepoDetailsScreen extends StatelessWidget {

  Repo repoData;

  RepoDetailsScreen({
    @required this.repoData,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
        appBar: AppBar(
          title: Text(repoData.name),
        ),
        body: ListView(
              children: [

                Consumer<RepoDetailsProv>(
                  builder:(context, prov, _)=>
                      TextButton(
                        child: Text('Commits'),
                        onPressed: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (_)=>
                              CommitScreen(repoData.commitsUrl)
                          ));
                        },
                  ),
                )

              ],
            )));
  }
}
