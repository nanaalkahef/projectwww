import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


class Celender extends StatefulWidget {
  const Celender({super.key});

  @override
  State<Celender> createState() => _CelenderState();
}

class _CelenderState extends State<Celender> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "${DateFormat("MMM,yyyy").format(_dateTime)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _dateTime =
                            DateTime(_dateTime.year, _dateTime.month - 1);
                      });
                    },
                    child: Icon(
                      Icons.chevron_left,
                      color: Colors.green,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _dateTime =
                            DateTime(_dateTime.year, _dateTime.month + 1);
                      });
                    },
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.green,
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          TableCalendar(
            focusedDay: _dateTime,
            firstDay: DateTime(2009),
            lastDay: DateTime(2030),
            headerVisible: false,
            onFormatChanged: (result) {},
            daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) =>
                    DateFormat("EEE").format(date).toUpperCase(),
                weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                weekendStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.green.shade900)),
            calendarStyle: CalendarStyle(
              todayDecoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
              markerDecoration:
                  BoxDecoration(color: Colors.green, shape: BoxShape.circle),
            ),
            onPageChanged: (theDate) {
              _dateTime = theDate;
              setState(() {
                
              });
            },
          )
        ],
      ),
    );
  }
}
