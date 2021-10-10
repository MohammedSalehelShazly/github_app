import 'package:flutter/material.dart';

class TimeFormatter extends StatelessWidget {

  final DateTime localTime24 ;
  final bool isEng;
  final Color clr;

  TimeFormatter({
    @required this.localTime24,
    @required this.isEng,
    this.clr = Colors.black
  });


   String addZero(int num)=>
       '${num<10 ? '0'+'$num' : '$num'}';

   String timeMidday(time24 ,bool isEng) =>
       isEng ?  time24.hour>=12 ? ' pm' : ' am'
           :
       time24.hour>=12 ? ' م' : ' ص';

    DateTime to12Hour(DateTime time){
      return time.hour>12 ? time.subtract(Duration(hours:12) )
          :  time ;
    }

    String address()=>
        '${localTime24.day}' + '/${localTime24.month}' +  '/${localTime24.year}';

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: clr),
        children: [

          TextSpan(text: 'Update at:  '),

          TextSpan(text: address() +' -  '),

          if(isEng)
            TextSpan(text: addZero(to12Hour(localTime24).hour) + ' : '),
          TextSpan(text: addZero(to12Hour(localTime24).minute) + ' '),

          if(!isEng)
            TextSpan(text: ' : '),
          if(!isEng)
            TextSpan(text: addZero(to12Hour(localTime24).hour) + ''),

          TextSpan(text: timeMidday(localTime24 ,isEng) +' '),
        ]
      ),
    );

  }
}