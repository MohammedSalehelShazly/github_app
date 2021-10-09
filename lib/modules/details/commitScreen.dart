import 'package:flutter/material.dart';
import 'package:github_app/logic/providers/mainProvider.dart';
import 'package:github_app/logic/providers/repoDetailsProv.dart';
import 'package:github_app/shared/components/timeFormatter.dart';
import 'package:provider/provider.dart';

class CommitScreen extends StatefulWidget {
  String commitsUrl;
  CommitScreen(this.commitsUrl);
  @override
  _CommitScreenState createState() => _CommitScreenState();
}

class _CommitScreenState extends State<CommitScreen> {

  bool first = true;
  @override
  void didChangeDependencies() {
    if(mounted && first){
      first = false;
      Provider.of<RepoDetailsProv>(context, listen: false).getCommits(context,widget.commitsUrl);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RepoDetailsProv>(
        builder: (context, prov ,_)=>

        prov.commitsData == null
            ? Center(child: const CircularProgressIndicator())
            :
            ListView.builder(
              itemCount: prov.commitsData.repos.length,
              itemBuilder: (context, index)=>
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        Text(prov.commitsData.repos[index].commit.message),
                        Text( 'By ' + prov.commitsData.repos[index].commit.committer.name, style: TextStyle(fontSize: 16),),
                        Text(prov.commitsData.repos[index].commit.committer.email, style: TextStyle(fontSize: 16)),

                        Row(
                          children: [
                            Text('At ', style: TextStyle(fontSize: 16)),
                            TimeFormatter(localTime24: prov.commitsData.repos[index].commit.committer.date,isEng: true,),
                          ],
                        ),







                      ],
                    ),
                  ),


            ),
      ),
    );
  }
}
