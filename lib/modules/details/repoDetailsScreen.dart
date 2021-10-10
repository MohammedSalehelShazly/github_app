import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_app/logic/providers/repoDetailsProv.dart';
import 'package:github_app/models/userRepos.dart';
import 'package:github_app/modules/details/commitScreen.dart';
import 'package:github_app/shared/components/staticVariables.dart';
import 'package:github_app/shared/styles/colors.dart';
import 'package:github_app/shared/styles/responsive.dart';
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
        body:  Consumer<RepoDetailsProv>(
          builder:(context, prov, _) {
            bool firstBuild = true;
            if(firstBuild && prov.imagesInReadme.length==0){
              firstBuild = false;
              print('prov.imagesInReadme ${prov.imagesInReadme}');

              prov.readmeContent(context: context, author: repoData.owner.login, repoName: repoData.name).then((value){
                Timer.periodic(Duration(seconds: 1), (timer) {
                  prov.getImagesInReadme(value);
                  timer.cancel();
                });
              });


            }

            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [

                  FittedBox(
                    child: InkWell(
                        onLongPress: () async {
                          await Clipboard.setData(ClipboardData(
                              text: repoData.url));
                          staticVars.showToast(
                              context, 'Url copied successfully');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(repoData.htmlUrl),
                        )),
                  ),

                  TextButton(
                    child: Text('Commits'),
                    onPressed: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (_) =>
                          CommitScreen(repoData.commitsUrl)
                      ));
                    },
                  ),


                  if(repoData.description != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Divider(
                        endIndent: 80, indent: 80, thickness: 2,),
                    ),

                  if(repoData.description != null)
                    Align(alignment: Alignment.centerLeft,
                        child: Text('Description', style: Theme
                            .of(context)
                            .textTheme
                            .headline6,)),

                  if(repoData.description != null)
                    Text(repoData.description),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Divider(
                      endIndent: 80, indent: 80, thickness: 2,),
                  ),

                  Align(alignment: Alignment.centerLeft,
                      child: Text('README.md', style: Theme
                          .of(context)
                          .textTheme
                          .headline6,)),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appClrs.mainColor.withOpacity(.3)
                    ),
                    child: FutureBuilder(
                        future: prov.readmeContent(
                          context: context,
                          author: repoData.owner.login,
                          repoName: repoData.name,
                        ),
                        builder: (context, snapshot) =>
                        snapshot.hasData
                            ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(snapshot.data),

                            ConstrainedBox(
                              constraints: BoxConstraints.expand(
                                height: responsive.sWidth(context) * .45,
                                width: responsive.sWidth(context) * 45,),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: prov.imagesInReadme.length,
                                  itemBuilder: (context, index) {
                                    print(prov.imagesInReadme[index]);


                                    return Container(
                                      height: responsive.sWidth(context) * .45,
                                      width: responsive.sWidth(context) * .45,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  prov.imagesInReadme[index].trim()),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    );
                                  }
                              ),
                            )
                          ],
                        )
                            : Center(child: ConstrainedBox(
                            constraints: BoxConstraints.expand(
                                height: 35, width: 35),
                            child: CircularProgressIndicator()))
                    ),
                  ),

                ],
              ),
            );
          }
        )));
  }
}
