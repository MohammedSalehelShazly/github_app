import 'package:flutter/material.dart';
import 'package:github_app/shared/components/timeFormatter.dart';

class AppListTile extends StatelessWidget {

  String txt;
  Function onTap;
  bool isPrivate;
  DateTime updateAt;
  String description;
  EdgeInsetsGeometry margin;

  AppListTile({
    @required this.txt,
    @required this.isPrivate,
    @required this.updateAt,
    this.onTap,
    this.description,
    this.margin = const EdgeInsets.all(8.0),
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: ListTile(
        title: Text(txt),
        trailing: Container(
          padding:  const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(),
            color: Colors.black26
          ),
          child: Text(isPrivate
              ? 'private'
              : 'public'),
        ),
        onTap: onTap,
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(description !=null)
              Text(description, maxLines: 1,),

            TimeFormatter(
                localTime24: updateAt,
                isEng: true)

          ],
        ),

      ),
    );
  }
}
