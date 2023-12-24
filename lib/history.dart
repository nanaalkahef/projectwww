import 'package:flutter/material.dart';
import 'package:projectw/celender.dart';
import 'package:projectw/side_bar_menu.dart';


class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
    DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //side menu
      Expanded(
        child: SideBar(),
      )

      //main body
      ,
      Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.all(50),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Expanded(
                    flex: 2,

                    //column1 tow container
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(50),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(30)),
                                child: ListView(
                                  )
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(50),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )
                      ],
                    )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(50),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(30)),
                      child:Celender()
                ))
              ],
            ),
          ))
    ])));
  }
}
