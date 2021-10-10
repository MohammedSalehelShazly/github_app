import 'package:flutter/material.dart';
import 'package:github_app/logic/providers/mainProvider.dart';
import 'package:github_app/logic/providers/repoDetailsProv.dart';
import 'package:github_app/shared/components/timeFormatter.dart';
import 'package:github_app/shared/styles/colors.dart';
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
    return SafeArea(
      child: Consumer<RepoDetailsProv>(
          builder: (context, prov ,_)=> WillPopScope(
          onWillPop: ()async{
            prov.resetCommitData();
            return true;
          },
          child: Scaffold(
            body:
            prov.commitsData == null
                ? Center(child: const CircularProgressIndicator())
                :
                ListView.builder(
                  itemCount: prov.commitsData.repos.length,
                  itemBuilder: (context, index)=>
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: appClrs.mainColor
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(child: Text(prov.commitsData.repos[index].commit.message.replaceAll("'", ""), style: TextStyle(fontSize: 18, color: Colors.white),)),
                            const Divider(endIndent: 100,indent: 100,),
                            Text( 'By ' + prov.commitsData.repos[index].commit.committer.name, style: TextStyle(fontSize: 16, color: Colors.white),),
                            const SizedBox(height: 7,),
                            Text(prov.commitsData.repos[index].commit.committer.email, style: TextStyle(fontSize: 16, color: Colors.white)),
                            const SizedBox(height: 7,),
                            TimeFormatter(localTime24: prov.commitsData.repos[index].commit.committer.date,isEng: true,clr: Colors.white,),
                          ],
                        ),
                      ),


                ),
          ),
        ),
      ),
    );
  }
}
