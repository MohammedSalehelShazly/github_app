import 'package:flutter/material.dart';
import 'package:github_app/logic/providers/mainProvider.dart';
import 'package:github_app/shared/components/repoItem.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool first = true;
  @override
  void didChangeDependencies() {
    if(mounted && first){
      first = false;
      Provider.of<MainProvider>(context, listen: false).getRepos(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(child: Consumer<MainProvider>(
      builder: (context, prov, _)=> Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text('All repository made with'),
            actions: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                margin: const EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12
                ),
                child: DropdownButton(
                  items: prov.filterLangListChose.map<DropdownMenuItem>((e) => DropdownMenuItem(
                    child: Text(e,style: TextStyle(color: Colors.black, fontSize: 18),),
                    value: e,
                  )).toList(),
                  value: prov.filterLang,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  onChanged: (val){
                    prov.changeFilterLang(val);
                    prov.filterRepos();
                  },
                ),
              ),
              //Expanded(child: const SizedBox())
            ],
          ),

          body: prov.filteredLanguages ==null
              ? Center(child: CircularProgressIndicator.adaptive())
              :
          ListView.builder(
            itemCount: prov.userRepos.repos.length,
            itemBuilder: (context, index) =>

            prov.filteredLanguages.contains(prov.userRepos.repos[index].name)
                  ?
              RepoItem(
                  repoData: prov.userRepos.repos[index]
              )
                  : const SizedBox()
          )),
    ));
  }
}
